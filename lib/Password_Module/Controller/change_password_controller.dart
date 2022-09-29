import 'dart:async';
import 'dart:convert';
import 'package:communiversity/utils/storage_data.dart';
import 'package:communiversity/Password_Module/Model/password_model.dart';
import 'package:communiversity/Widgets/app_loader.dart';
import 'package:communiversity/Widgets/app_snackbar.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/api_services.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> changepasswordFormkey = GlobalKey<FormState>();
  Storagedata storage = Storagedata();

  RxString currentpasswordcolor = ''.obs;
  RxString passwordcolor = ''.obs;
  RxString confirmpasswordcolor = ''.obs;

  late TextEditingController oldpasswordController, newpasswordController;

  var oldpassword = '';
  var newpassword = '';

  @override
  void onInit() {
    super.onInit();
    oldpasswordController = TextEditingController();
    newpasswordController = TextEditingController();
  }

  @override
  void onClose() {
    oldpasswordController.dispose();
    newpasswordController.dispose();
  }

  //---------------------------Change Password Api------------------------------
  Future<void> checkChange() async {
    final isValid = changepasswordFormkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    changepasswordFormkey.currentState!.save();
    final Map<String, dynamic> data = <String, dynamic>{};

    data['user_id'] = storage.id;
    data['old_password'] = oldpassword;
    data['new_password'] = newpassword;
    // try {
    var response =
        await ApiService.put(NetworkStrings.changetpasswordEndpoint, data, true)
        //     .timeout(
        //   const Duration(seconds: 20),
        // )
        ;

    var values = jsonDecode(response!.body);

    if (response.statusCode == 200) {
      var obj = PasswordModel.fromJson(values);
      AppSnackBar(obj.message!);
      //---------------------------Go to Main Menu---------------------------
      Get.offAllNamed(Paths.MAIN_SCREEN_ROUTE);
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
