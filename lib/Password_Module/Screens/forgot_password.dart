import 'package:communiversity/Password_Module/Controller/forgot_password_controller.dart';
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

class ForgotPassword extends StatelessWidget {
  final ForgotPasswordController forgotController =
      Get.put(ForgotPasswordController());
   ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_ICON,
        onclickLead: () {
          Get.back();
        },
        title: AppStrings.FORGOT_PASSWORD_MAIN_TEXT,
        headimagesList: [AssetPaths.BACKGROUND_LOGIN_IMAGE],
        // headImagePath: AssetPaths.BACKGROUND_LOGIN_IMAGE,
        bodyChild: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: screeen_padding.screenPadding),
                child:Obx(
                  () =>  Form(
                  key: forgotController.forgotFormkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      //----------------Email Address Field----------------
                      emailAddressWidget(),
                      SizedBox(height: 20.h),
                      //----------------Login Button----------------
                      loginButtonWidget(),
                    ],
                  ),
                )))));
  }

  Widget emailAddressWidget() {
    return CustomTextField(
      hint: AppStrings.EMAIL_FIELD_TEXT,
      prefxicon: AssetPaths.EMAIL_ICON,
      prefixIconSize: 22.w,
      prefixRIghtPadding: 15.w,
      sufixRIghtPadding: 1.w,
      controller: forgotController.emailController,
      onsave: (value) {
        forgotController.email = value!;
      },
       onchange: (changevalue) {
          forgotController.emailcolor.value = changevalue;
        },
        colorOff: forgotController.emailcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
      validator: (value) {
        return FieldValidator.validateEmail(value!);
      }
    );
  }

  Widget loginButtonWidget() {
    return CustomButton(
        text: AppStrings.SEND_CODE_BUTTON_TEXT,
        onclick: () {
          forgotController.checkForgot();
          // Get.offNamed(Paths.OTP_VERIFICATION_SCREEN_ROUTE);
        });
  }
}
