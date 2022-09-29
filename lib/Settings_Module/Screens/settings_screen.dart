import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_button.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool val = true;
  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_TRANSPARENT_ICON,
        onclickLead: () {
          Get.back();
        },
        title: AppStrings.SETTINGS_TEXT,
        bodyChild: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: screeen_padding.screenPadding),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              //----------------Email Address Field----------------
              receiveNotificationWidget(),
              SizedBox(height: 30.h),
              //----------------Login Button----------------
              saveButtonWidget(),
              //----------------Dont have an Account----------------
            ],
          ),
        )));
  }

  Widget receiveNotificationWidget() {
    return Row(children: [
      CustomText(
          maintext: AppStrings.RECEIVE_NOTIFICATIONS_TEXT,

          // fontsize: 22.sp,
          fontWeight: FontWeight.w500),
      const Spacer(),
      Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: val,
          onChanged: (bool value) {
            setState(() {
              val = value;
            });
          },
        ),
      ),
    ]);
  }

  Widget saveButtonWidget() {
    return CustomButton(
        text: AppStrings.CHANGE_PASSWORD_BUTTON_TEXT,
        onclick: () {
          Get.toNamed(Paths.CHANGE_PASSWORD_SCREEN_ROUTE);
          // changePassController.checkChange();
        });
  }
}
