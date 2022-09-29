import 'dart:async';
import 'dart:convert';
import 'package:communiversity/Widgets/app_loader.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:communiversity/Auth_Module/Model/user_model.dart';
import 'package:communiversity/Widgets/app_snackbar.dart';
import 'package:communiversity/Widgets/app_toast.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/api_services.dart';
import 'package:communiversity/utils/Services/firebase_messaging.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  RxString emailcolor = ''.obs;
  RxString passwordcolor = ''.obs;

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
   
  }

  //----------------------------------Login Api---------------------------------
  Future<void> checkLogin() async {
    final isValid = loginFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};
    FirebaseMessagingService firebase = FirebaseMessagingService();

    data['user_email'] = email;
    data['user_password'] = password;
    data['user_device_token'] = await firebase.getToken();
    try {
    var response =
        await ApiService.post(NetworkStrings.signinEndpoint, data, false)
                .timeout(
          const Duration(seconds: 20),
        )
        ;
    var values = jsonDecode(response!.body);
    if (response.statusCode == 200) {
      var obj = UserModel.fromJson(values);
      print(await firebase.getToken());
      print("==================DEVICE TOKEN======================");
      if (obj.data!.verified == 1) {
        await box.write("token", obj.token);

        AppSnackBar(obj.message!);
        //------------------------Go to Main Menu-----------------------
        Get.offAllNamed(Paths.MAIN_SCREEN_ROUTE);
        Storagedata storage = Storagedata();
        storage.write(obj.data);
        
      } else {
        AppSnackBar(obj.message!);
        AppToast(obj.data!.code.toString());
        //------------------------Go to OTP VERIFICATION-----------------------
        Get.offAllNamed(Paths.OTP_VERIFICATION_SCREEN_ROUTE, arguments: false);
      }
    } else {
      AppSnackBar(values['message']);
    }
    } on TimeoutException catch (_) {
      stopLoading();
      AppSnackBar("Server Problem");
    } catch (_) {
      stopLoading();
      AppSnackBar("App is not working correct contact Admin");
    }
  }
}
