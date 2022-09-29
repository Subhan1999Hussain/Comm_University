import 'dart:async';
import 'dart:convert';
import 'package:communiversity/Password_Module/Model/forgot_model.dart';
import 'package:communiversity/Widgets/app_loader.dart';
import 'package:communiversity/Widgets/app_snackbar.dart';
import 'package:communiversity/Widgets/app_toast.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/api_services.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

dynamic user_id;

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> forgotFormkey = GlobalKey<FormState>();
  RxString emailcolor = ''.obs;


  late TextEditingController emailController;
  var email = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  //---------------------------Forget Password Api------------------------------
  Future<void> checkForgot() async {
    final isValid = forgotFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    forgotFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['user_email'] = email;
    // try {
      var response =
          await ApiService.post(NetworkStrings.forgotEndpoint, data, false)
      //         .timeout(
      //   const Duration(seconds: 20),
      // )
      ;
      var values = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var obj = ForgotModel.fromJson(values);

        AppToast("123456");

        user_id = obj.data!.userId;
        //-----------------------Go to OTP VERIFICATION-------------------------
        Get.toNamed(Paths.OTP_VERIFICATION_SCREEN_ROUTE,
            arguments: [true, user_id]);
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
