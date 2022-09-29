import 'package:communiversity/Auth_Module/Controller/login_controller.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_bottom_container.dart';
import 'package:communiversity/Widgets/custom_button.dart';
import 'package:communiversity/Widgets/custom_text.dart';
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

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      title: AppStrings.LOGIN_MAIN_TEXT,
      headimagesList: [AssetPaths.BACKGROUND_LOGIN_IMAGE],
      bodyChild: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: screeen_padding.screenPadding),
          child: Obx(
            () => Form(
              key: loginController.loginFormkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(children: [
                
                SizedBox(height: 30.h),
                //----------------Email Address Field----------------
                emailAddressWidget(),
                SizedBox(height: 20.h),
                //----------------Password Field----------------
                passwordWidget(),
                SizedBox(height: 0.05.sh),
                //----------------Forget Password Text----------------
                forgetPasswordWidget(),
                SizedBox(height: 0.05.sh),
                //----------------Login Button----------------
                loginButtonWidget(),
                //----------------Dont have an Account----------------
                dontHaveAnAccountWidget(),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailAddressWidget() {
    return CustomTextField(
        hint: AppStrings.EMAIL_FIELD_TEXT,
        prefxicon: AssetPaths.EMAIL_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        controller: loginController.emailController,
        onsave: (value) {
          loginController.email = value!;
        },
        onchange: (changevalue) {
          loginController.emailcolor.value = changevalue;
        },
        colorOff: loginController.emailcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validateEmail(value!);
        });
  }

  Widget passwordWidget() {
    return CustomTextField(
        hint: AppStrings.PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        prefixRIghtPadding: 15.w,
        sufixicon: FieldValidator.isHidepassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHidepassword.value,
        onclick: () {
          FieldValidator.password_hideIcon();
        },
        controller: loginController.passwordController,
        onsave: (value) {
          loginController.password = value!;
        },
        onchange: (changevalue) {
          loginController.passwordcolor.value = changevalue;
        },
        colorOff: loginController.passwordcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validatePassword(value!);
        });
  }

  Widget forgetPasswordWidget() {
    return GestureDetector(
        onTap: (() {
          Get.toNamed(Paths.FORGOT_PASSWORD__SCREEN_ROUTE);
        }),
        child: CustomText(
            maintext: AppStrings.FORGOT_PASSWORD_TEXT,
            color: AppColors.BLACK_COLOR,
            fontsize: 15.0.sp,
            fontWeight: FontWeight.bold,
            is_alignLeft: false));
  }

  Widget loginButtonWidget() {
    return CustomButton(
        text: AppStrings.LOGIN_BUTTON_TEXT,
        onclick: () {
          loginController.checkLogin();
        });
  }

  Widget dontHaveAnAccountWidget() {
    return CustomBottomContainer(
        starttext: AppStrings.DONT_HAVE_AN_ACCOUNT_TEXT,
        endtext: AppStrings.SIGNUP_BOTTOM_TEXT,
        onclick: () {
          Get.toNamed(Paths.SIGNUP_SCREEN_ROUTE);
        });
  }
}
