import 'dart:io';
import 'package:communiversity/Auth_Module/Controller/signup_controller.dart';
import 'package:communiversity/Auth_Module/custom_widget/custom_bottom_sheet.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_bottom_container.dart';
import 'package:communiversity/Widgets/custom_button.dart';
import 'package:communiversity/Widgets/custom_dropdown_field.dart';
import 'package:communiversity/Widgets/custom_text_field.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:communiversity/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/app_strings.dart';

class SignUp extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      leading: AssetPaths.BACK_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.SIGN_UP_MAIN_TEXT,
      headimagesList: const [AssetPaths.BACKGROUND_SIGNUP_IMAGE],
      bodyChild: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: screeen_padding.screenPadding),
          child: Obx(
            () => Form(
              key: signupController.signupFormkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(children: [
                //----------------Profile Pic----------------
                SizedBox(height: 30.h),
                profileicWidget(context),
                SizedBox(height: 20.h),
                //----------------User Name Field----------------
                userNameWidget(),
                SizedBox(height: 20.h),
                //----------------Email Address Field----------------
                emailAddressWidget(),
                SizedBox(height: 20.h),
                //----------------Program DropDown----------------
                programDorpDownWidget(),
                SizedBox(height: 20.h),
                //----------------Address Field----------------
                addressWidget(),
                SizedBox(height: 20.h),
                //---------------Password Field----------------
                passwordWidget(),
                SizedBox(height: 20.h),
                //----------------Confirm Password
                // Field----------------
                confirmPasswordWidget(),
                SizedBox(height: 20.h),
                //----------------Bio Field----------------
                bioWidget(),
                SizedBox(height: 0.05.sh),

                //----------------SignUp Button----------------
                signupButtonWidget(),
                //----------------Already have an Account----------------
                alreadyHaveAnAccountWidget(),
                SizedBox(
                  height: 20.h,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget userNameWidget() {
    return CustomTextField(
        hint: AppStrings.USERNAME_FIELD_TEXT,
        prefxicon: AssetPaths.USER_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        controller: signupController.usernameController,
        onsave: (value) {
          signupController.username = value!;
        },
        onchange: (changevalue) {
          signupController.usernamecolor.value = changevalue;
        },
        colorOff: signupController.usernamecolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validateName(value!);
        });
  }

  Widget emailAddressWidget() {
    return CustomTextField(
        hint: AppStrings.EMAIL_FIELD_TEXT,
        prefxicon: AssetPaths.EMAIL_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        controller: signupController.emailController,
        onsave: (value) {
          signupController.email = value!;
        },
        onchange: (changevalue) {
          signupController.emailcolor.value = changevalue;
        },
        colorOff: signupController.emailcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validateEmail(value!);
        });
  }

  Widget programDorpDownWidget() {
    return CustomDropdownField(
      Itemsss: AppStrings.ASD,
      onchange: (newItem) {
        signupController.program.value = newItem.toString();
        signupController.programcolor.value = newItem.toString();
      },
      colorOff: signupController.programcolor.value.isNotEmpty
          ? AppColors.PRIMARY_COLOR
          : AppColors.GREY_COLOR,
    );
  }

  Widget addressWidget() {
    return CustomTextField(
        hint: AppStrings.ADDRESS_FIELD_TEXT,
        prefxicon: AssetPaths.LOCATION_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        controller: signupController.addressController,
        onsave: (value) {
          signupController.address = value!;
        },
        onchange: (changevalue) {
          signupController.addresscolor.value = changevalue;
        },
        colorOff: signupController.addresscolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.valiadteEmpty(value!);
        });
  }

  Widget passwordWidget() {
    return CustomTextField(
        hint: AppStrings.PASSWORD_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 18.w,
        sufixicon: FieldValidator.isHidepassword.value
            ? AssetPaths.PASSWORD_SHOW
            : AssetPaths.PASSWORD_HIDE,
        obscureText: FieldValidator.isHidepassword.value,
        onclick: () {
          FieldValidator.password_hideIcon();
        },
        controller: signupController.passwordController,
        onsave: (value) {
          signupController.password = value!;
        },
        onchange: (changevalue) {
          signupController.passwordcolor.value = changevalue;
        },
        colorOff: signupController.passwordcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validatePassword(value!);
        });
  }

  Widget confirmPasswordWidget() {
    return CustomTextField(
        hint: AppStrings.CONFIRM_PASSWORD_FIELD_TEXT,
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
          signupController.confirmpasswordcolor.value = changevalue;
        },
        colorOff: signupController.confirmpasswordcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validateConfirmPassword(
              signupController.passwordController.text, value!);
        });
  }

  Widget bioWidget() {
    return CustomTextField(
        hint: AppStrings.BIO_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        controller: signupController.bioController,
        onsave: (value) {
          signupController.bio = value!;
        },
        onchange: (changevalue) {
          signupController.biocolor.value = changevalue;
        },
        colorOff: signupController.biocolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.valiadteEmpty(value!);
        });
  }

  Widget signupButtonWidget() {
    return CustomButton(
        text: AppStrings.SIGN_UP_BUTTON_TEXT,
        onclick: () {
          signupController.checkSignup();
        });
  }

  Widget alreadyHaveAnAccountWidget() {
    return CustomBottomContainer(
        starttext: AppStrings.ALREADY_HAVE_AN_ACCOUNT_TEXT,
        endtext: AppStrings.LOGIN_BOTTOM_TEXT,
        onclick: () {
          Get.toNamed(Paths.LOGIN_SCREEN_ROUTE);
        });
  }

  //----------------------------Bottom Sheet-------------------------------------
  bottomsheet(BuildContext context) {
    return CustomBottomSheet(camera: () {
      signupController.imagePick.takephoto(ImageSource.camera);
    }, gallery: () {
      signupController.imagePick.takephoto(ImageSource.gallery);
    });
  }

  Widget profileicWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context, builder: (context) => bottomsheet(context));
      },
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.PRIMARY_COLOR, width: 5.w),
            shape: BoxShape.circle,
            image: DecorationImage(
                scale: 3.sp,
                image: signupController.imagePick.isprofilepicpathset == true
                    ? FileImage(
                        File(signupController.imagePick.profilepicpath.value))
                    : const AssetImage(AssetPaths.USER_PROFILE_ICON)
                        as ImageProvider)),
      ),
    );
  }
}
