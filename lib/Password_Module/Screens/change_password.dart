import 'package:communiversity/Password_Module/Controller/change_password_controller.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_button.dart';
import 'package:communiversity/Widgets/custom_text_field.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:communiversity/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  final ChangePasswordController changepassController =
      Get.put(ChangePasswordController());
   ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_TRANSPARENT_ICON,
        onclickLead: () {
          Get.back();
        },
        title: AppStrings.CHANGE_PASSWORD_TEXT,
        bodyChild: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: screeen_padding.screenPadding),
                child: Obx(
                  () => Form(
                    key: changepassController.changepasswordFormkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        //----------------Email Address Field----------------
                        currentPasswordWidget(),
                        SizedBox(height: 20.h),
                        newPasswordWidget(),
                        SizedBox(height: 20.h),
                  
                        //----------------Password Field----------------
                  
                        confirmPasswordWidget(),
                        SizedBox(height: 0.2.sh),
                        //----------------Forget Password Text----------------
                  
                        //----------------Login Button----------------
                        saveButtonWidget(),
                        //----------------Dont have an Account----------------
                      ],
                    ),
                  ),
                ))));
  }

  Widget currentPasswordWidget() {
    return CustomTextField(
      hint: AppStrings.CURRENT_PASSWORD_FIELD_TEXT,
      prefxicon: AssetPaths.LOCK_ICON,
      prefixIconSize: 18.w,
      sufixicon: FieldValidator.isHideoldpassword.value
          ? AssetPaths.PASSWORD_SHOW
          : AssetPaths.PASSWORD_HIDE,
      obscureText: FieldValidator.isHideoldpassword.value,
      onclick: () {
        FieldValidator.oldpassword_hideIcon();
      },
      controller: changepassController.oldpasswordController,
      onsave: (value) {
        changepassController.oldpassword = value!;
      },
      onchange: (changevalue) {
          changepassController.currentpasswordcolor.value = changevalue;
        },
        colorOff: changepassController.currentpasswordcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
      validator: (value) {
        return FieldValidator.validatePassword(value!);
      }
    );
  }

  Widget newPasswordWidget() {
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
      controller: changepassController.newpasswordController,
      onsave: (value) {
        changepassController.newpassword = value!;
      },
      onchange: (changevalue) {
          changepassController.passwordcolor.value = changevalue;
        },
        colorOff: changepassController.passwordcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
      validator: (value) {
        return FieldValidator.validatePassword(value!);
      }
    );
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
          changepassController.confirmpasswordcolor.value = changevalue;
        },
        colorOff: changepassController.confirmpasswordcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
      validator: (value) {
        return FieldValidator.validateConfirmPassword(
            changepassController.newpasswordController.text, value!);
      }
    );
  }

  Widget saveButtonWidget() {
    return CustomButton(
        text: AppStrings.SAVE_CHANGES_BUTTON_TEXT,
        onclick: () {
          // Get.toNamed(Paths.SETTINGS_SCREEN_ROUTE);
          changepassController.checkChange();
        });
  }
}
