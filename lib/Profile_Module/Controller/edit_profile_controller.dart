import 'dart:async';
import 'dart:convert';
import 'package:communiversity/Profile_Module/Model/profile_model.dart';
import 'package:communiversity/Widgets/app_loader.dart';
import 'package:communiversity/Widgets/app_snackbar.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/connectivity_manager.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:communiversity/utils/pick_image.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// final box = GetStorage();
// dynamic user_id;

class EditProfileControler extends GetxController {
  final GlobalKey<FormState> editProfileFormkey = GlobalKey<FormState>();
// final GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  // FirebaseMessagingService firebase = FirebaseMessagingService();
  Storagedata storage = Storagedata();

  PickImage imagePick = PickImage();
  RxString usernamecolor = ''.obs;
  RxString emailcolor = ''.obs;
  RxString programcolor = ''.obs;
  RxString addresscolor = ''.obs;
  // RxString passwordcolor = ''.obs;
  // RxString confirmpasswordcolor = ''.obs;
  RxString biocolor = ''.obs;

  // var isprofilepicpathset = false.obs;
  // var profilepicpath = "".obs;
  late TextEditingController usernameController,
      emailController,
      addressController,
      bioController;

  var username = '';
  var email = '';
  // var password = '';
  // var confirmpassword = '';
  var address = '';
  var bio = '';
  var program = ''.obs;

  @override
  void onInit() {
    super.onInit();
    program.value = storage.program;
    programcolor.value = program.value;
    usernameController = TextEditingController(text: storage.username);
    usernamecolor.value = usernameController.text;
    emailController = TextEditingController(text: storage.useremail);
    emailcolor.value = emailController.text;
    addressController = TextEditingController(text: storage.address);
    addresscolor.value = addressController.text;
    bioController = TextEditingController(text: storage.bio);
    biocolor.value = bioController.text;
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();

    addressController.dispose();
    bioController.dispose();
  }

  Future<void> editProfile() async {
    final isValid = editProfileFormkey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      editProfileFormkey.currentState!.save();
      showLoading();

      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        // try {
        var token = box.read('token');
        Map<String, String> header = {"Authorization": 'Bearer $token'};
        var uri = Uri.parse(NetworkStrings.baseUrl +
            NetworkStrings.api +
            NetworkStrings.editProfleEndpont);
        var request = http.MultipartRequest('PUT', uri);
        request.headers.addAll(header);
        //   data['user_name'] = username;
        //   data['user_email'] = email;
        //   data[
        //   data['program'] = "bachelors";
        //   data['address'] = address;
        //   data['bio'] = bio;
        //   data['profilePicture'] =
        //       "/C:/Users/sheheryar.waseem/Downloads/1498199 (2).jpg";
        //   data['user_device_token'] = "444";

        request.fields['user_name'] = username;
        // request.fields['user_email'] = email;
        // request.fields['user_password'] = password;
        request.fields['program'] = program.value;
        request.fields['address'] = address;
        request.fields['bio'] = bio;
        // request.fields['profilePicture'] =
        //     "/C:/Users/sheheryar.waseem/Downloads/1498199 (2).jpg";
        // request.fields['user_device_token'] = (await firebase.getToken())!;
        // request.fields['position'] = option.value;

        if (imagePick.profilepicpath.value.isNotEmpty) {
          var multipart = http.MultipartFile.fromPath(
              'profilePicture', imagePick.profilepicpath.value);

          request.files.add(await multipart);
        }
        var streamResponse = await request.send();

        var response = await http.Response.fromStream(streamResponse)
            // .timeout(
            //   const Duration(seconds: 8),
            // )
            ;
        print(response.body);
        print(
            "----------------------000000000000000000000000000--------------------------------------");
        var values = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var obj = ProfleModel.fromJson(values);
          storage.write(obj.user);
          // await box.write("full_name", obj.data.!.fullName);
          // await box.write("user_email", obj.user!.userEmail);
          // await box.write("user_Image", obj.user!.userImage);
          // await box.write("license_num", obj.user!.licenseNum.toString());
          // await box.write("ssn", obj.user!.ssn);
          // await box.write("position", obj.user!.position);

          stopLoading();

          AppSnackBar(obj.message!);
          Get.offNamed(Paths.MAIN_SCREEN_ROUTE);
        } else {
          stopLoading();

          AppSnackBar("Failed To load image in Server");
        }
        //   } on TimeoutException catch (_) {
        //     stopLoading();
        //     AppSnackBar("Server Problem");
        //   } catch (_) {
        //     stopLoading();
        //     SnackBar_Message("App is not working correct contact Admin");
        //   }
        // } else {
        //   stopLoading();
        //   SnackBar_Message("NO_INTERNET_CONNECTION");
        //   return;
        // }
      }
    }
  }
}
