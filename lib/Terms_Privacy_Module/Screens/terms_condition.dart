import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_TRANSPARENT_ICON,
        onclickLead: () {
          Get.back();
        },
        title: AppStrings.TERMS_CONDITION_TEXT,
        bodyChild: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: screeen_padding.screenPadding),
          child: Column(
            children: [
              // SizedBox(height: 30.h),
              //----------------Email Address Field----------------
              conditionsWidget(),
              SizedBox(height: 30.h),
              //----------------Login Button----------------

              //----------------Dont have an Account----------------
            ],
          ),
        )));
  }

  Widget conditionsWidget() {
    return CustomText(
      maintext: AppStrings.LOREM_HEAVY,

      // fontsize: 22.sp,
    );
  }
}
