import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSnackBar {
  AppSnackBar(String msg) {
    Get.rawSnackbar(
      maxWidth: .9.sw,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.BLACK_COLOR,
      duration: const Duration(seconds: 2),
      messageText: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: CustomText(
          maintext: msg,
          fontsize: 20.sp,
          color: AppColors.WHITE_COLOR,
          is_alignLeft: false,
        ),
      ),
    );
  }
}
