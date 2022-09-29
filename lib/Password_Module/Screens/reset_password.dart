import 'package:communiversity/Password_Module/Controller/reset_password_controller.dart';
import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_button.dart';
import 'package:communiversity/Widgets/custom_text_field.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:communiversity/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  final ResetPasswordController resetController =
      Get.put(ResetPasswordController());
  ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_ICON,
        onclickLead: () {
          Get.back();
        },
        title: AppStrings.RESET_PASSWORD_TEXT,
        headimagesList: [AssetPaths.BACKGROUND_RESET_IMAGE],
        // headImagePath: AssetPaths.BACKGROUND_RESET_IMAGE,
        bodyChild: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: screeen_padding.screenPadding),
                child: Obx(() => Form(
                    key: resetController.resetpasswordFormkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        //----------------Email Address Field----------------
                        passwordWidget(),
                        SizedBox(height: 20.h),
                        //----------------Login Button----------------
                        confirmPasswordWidget(),
                        SizedBox(height: 30.h),
                        //----------------Login Button----------------
                        loginButtonWidget(),
                      ],
                    ))))));
  }

  Widget passwordWidget() {
    return CustomTextField(
        hint: AppStrings.NEW_PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        sufixicon: FieldValidator.isHidepassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHidepassword.value,
        onclick: () {
          FieldValidator.password_hideIcon();
        },
        controller: resetController.passwordController,
        onsave: (value) {
          resetController.password = value!;
        },
        onchange: (changevalue) {
          resetController.passwordcolor.value = changevalue;
        },
        colorOff: resetController.passwordcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validatePassword(value!);
        });
  }

  Widget confirmPasswordWidget() {
    return CustomTextField(
        hint: AppStrings.CONFIRM_NEW_PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        sufixicon: FieldValidator.isHideconfirmpassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHideconfirmpassword.value,
        onclick: () {
          FieldValidator.confirm_password_hideIcon();
        },
        onsave: (value) {},
        onchange: (changevalue) {
          resetController.confirmpasswordcolor.value = changevalue;
        },
        colorOff: resetController.confirmpasswordcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validateConfirmPassword(
              resetController.passwordController.text, value!);
        });
  }

  Widget loginButtonWidget() {
    return CustomButton(
        text: AppStrings.CHANGE_PASSWORD_BUTTON_TEXT,
        onclick: () {
          resetController.checkReset();
          // Get.offNamed(Paths.LOGIN_SCREEN_ROUTE);
        });
  }
}
