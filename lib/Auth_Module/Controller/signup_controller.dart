import 'dart:async';
import 'dart:convert';
import 'package:communiversity/utils/pick_image.dart';
import 'package:communiversity/Auth_Module/Model/signup_model.dart';
import 'package:communiversity/Widgets/app_loader.dart';
import 'package:communiversity/Widgets/app_snackbar.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/connectivity_manager.dart';
import 'package:communiversity/utils/Services/firebase_messaging.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

dynamic user_id;

class SignupController extends GetxController {
  final GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  FirebaseMessagingService firebase = FirebaseMessagingService();
        PickImage imagePick = PickImage();
  RxString usernamecolor = ''.obs;
  RxString emailcolor = ''.obs;
  RxString programcolor = ''.obs;
  RxString addresscolor = ''.obs;
  RxString passwordcolor = ''.obs;
  RxString confirmpasswordcolor = ''.obs;
  RxString biocolor = ''.obs;

 
  late TextEditingController usernameController,
      emailController,
      passwordController,
      confirmPasswordController,
      addressController,
      bioController;

  var username = '';
  var email = '';
  var password = '';
  var confirmpassword = '';
  var address = '';
  var bio = '';
  var program = ''.obs;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    addressController = TextEditingController();
    bioController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
    bioController.dispose();
  }

  //-------------------------------SignUp Api-----------------------------------
  Future<void> checkSignup() async {
    final isValid = signupFormkey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      signupFormkey.currentState!.save();
      showLoading();

      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
       
        var uri = Uri.parse(NetworkStrings.baseUrl +
            NetworkStrings.api +
            NetworkStrings.signupEndpoint);
        var request = http.MultipartRequest('POST', uri);

        request.fields['user_name'] = username;
        request.fields['user_email'] = email;
        request.fields['user_password'] = password;
        request.fields['program'] = program.value;
        request.fields['address'] = address;
        request.fields['bio'] = bio;
        request.fields['user_device_token'] = (await firebase.getToken())!;
try{
        if (imagePick.profilepicpath.value.isNotEmpty) {
          var multipart = http.MultipartFile.fromPath(
              'profilePicture', imagePick.profilepicpath.value);

          request.files.add(await multipart);
        }
        var streamResponse = await request.send();

        var response = await http.Response.fromStream(streamResponse)
            .timeout(
              const Duration(seconds: 8),
            )
            ;
      
        var values = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var obj = SignupModel.fromJson(values);

        

          stopLoading();

          AppSnackBar(obj.message!);
          user_id = obj.data!.userId;
          Get.offNamed(Paths.OTP_VERIFICATION_SCREEN_ROUTE,
              arguments: [false, user_id]);
        } else {
          stopLoading();

          AppSnackBar("Failed To load image in Server");
        }
          } on TimeoutException catch (_) {
            stopLoading();
            AppSnackBar("Server Problem");
          } catch (_) {
            stopLoading();
            AppSnackBar("App is not working correct contact Admin");
          }
        } else {
          stopLoading();
          AppSnackBar("NO_INTERNET_CONNECTION");
          return;
        }
      }
    }
  }

