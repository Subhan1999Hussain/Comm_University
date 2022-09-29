import 'dart:async';
import 'dart:convert';
import 'package:communiversity/Auth_Module/Model/user_model.dart';
import 'package:communiversity/Widgets/app_loader.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:communiversity/Auth_Module/Model/resend_code_model.dart';
import 'package:communiversity/Widgets/app_snackbar.dart';
import 'package:communiversity/Widgets/app_toast.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/Services/api_services.dart';

class OtpVerificationController extends GetxController {
  final GlobalKey<FormState> otpFormkey = GlobalKey<FormState>();
  Storagedata storage = Storagedata();

  //-------------------------------Arguments--------------------------------
  dynamic args = Get.arguments;
  late TextEditingController pinController;
  var pin = '';
  var count = 10;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    StartTime();
    pinController = TextEditingController();
  }

  //-------------------------------Initial Timer--------------------------------
  void StartTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
        update();
      } else
        _timer.cancel();
      update();
    });
  }

  //--------------------------------Reset Timer---------------------------------
  void reset() {
    _timer.cancel();
    count = 10;
    update();
    StartTime();
    reSend();
  }

  //--------------------------------Otp Api---------------------------------
  Future<void> checkOtp() async {
    final isValid = otpFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    otpFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = args[1];
    data['verification_code'] = pin;
    try {
      var response =
          await ApiService.post(NetworkStrings.verifyuserEndpoint, data, false)
              .timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var obj = UserModel.fromJson(values);
        AppSnackBar(obj.message!);

        if (args[0] == false) {
          await box.write("token", obj.token);

          storage.write(obj.data);
          //--------------------------Go to Setup Profile-----------------------
          Get.offAllNamed(Paths.MAIN_SCREEN_ROUTE);
        } else {
          //------------------------Go to Reset Password------------------------
          Get.offNamed(Paths.RESET_PASSWORD_SCREEN_ROUTE, arguments: args[1]);
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

  //-----------------------------Resend Otp Code Api----------------------------
  Future<void> reSend() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = args[1];
    try {
      var response =
          await ApiService.post(NetworkStrings.resendotpEndpoint, data, false)
              .timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var obj = ResendModel.fromJson(values);
        AppSnackBar(obj.message!);
        AppToast("123456");
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
