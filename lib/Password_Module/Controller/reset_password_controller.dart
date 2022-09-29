import 'dart:async';
import 'dart:convert';
import 'package:communiversity/utils/storage_data.dart';
import 'package:communiversity/Password_Module/Model/password_model.dart';
import 'package:communiversity/Widgets/app_loader.dart';
import 'package:communiversity/Widgets/app_snackbar.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/api_services.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ResetPasswordController extends GetxController {
  final GlobalKey<FormState> resetpasswordFormkey = GlobalKey<FormState>();
  Storagedata storage =Storagedata();


  RxString passwordcolor = ''.obs;
  RxString confirmpasswordcolor = ''.obs;


  late TextEditingController passwordController;

  var password = '';

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    passwordController.dispose();
  }

  //---------------------------Forget Password Api------------------------------
  Future<void> checkReset() async {
    final isValid = resetpasswordFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    dynamic args = Get.arguments;
    resetpasswordFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['user_id'] = args;
    data['new_password'] = password;
    // try {
      var response = await ApiService.post(
              NetworkStrings.updatepasswordEndpoint, data, false)
      //     .timeout(
      //   const Duration(seconds: 20),
      // )
      ;
      var values = jsonDecode(response!.body);

      if (response.statusCode == 200) {
        var obj = PasswordModel.fromJson(values);
        AppSnackBar(obj.message!);
        //----------------------------Pre Login-----------------------------------
        Get.offAllNamed(Paths.LOGIN_SCREEN_ROUTE);
      } else {
        AppSnackBar(values['message']);
      }
    // } on TimeoutException catch (_) {
    //   stopLoading();
    //   AppSnackBar("Server Problem");
    // } catch (_) {
    //   stopLoading();
    //   AppSnackBar("App is not working correct contact Admin");
    // }
  }
}
