import 'package:communiversity/Profile_Module/Controller/edit_profile_controller.dart';
import 'package:communiversity/Profile_Module/Custom_Widget/profile_stack.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_button.dart';
import 'package:communiversity/Widgets/custom_dropdown_field.dart';
import 'package:communiversity/Widgets/custom_text_field.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:communiversity/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatelessWidget {
  final EditProfileControler editPrfileController =
      Get.put(EditProfileControler());

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_TRANSPARENT_ICON,
        onclickLead: () {
          Get.back();
        },
        title: AppStrings.EDIT_PROFILE_TEXT,
        bodyChild: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: screeen_padding.screenPadding),
          child: Obx(
            () => Form(
              key: editPrfileController.editProfileFormkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  profileWidget(),
                  SizedBox(height: 20.h),
                  userNameWidget(),
                  SizedBox(height: 20.h),
                  //----------------Email Address Field----------------
                  emailAddressWidget(),
                  SizedBox(height: 20.h),
                  positionDorpDownWidget(),
                  SizedBox(height: 20.h),

                  //----------------User Name Field----------------
                  addressWidget(),
                  SizedBox(height: 20.h),

                  //----------------Password Field----------------
                  bioWidget(),
                  SizedBox(height: 0.05.sh),

                  //----------------Login Button----------------
                  updateButtonWidget(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        )));
  }

  Widget profileWidget() {
    return ProfileStack(
      profilePicPathSet: editPrfileController.imagePick.isprofilepicpathset,
      profilePicPath: editPrfileController.imagePick.profilepicpath.value,
      controller: editPrfileController,
    );
  }

  Widget userNameWidget() {
    return CustomTextField(
        hint: AppStrings.USERNAME_FIELD_TEXT,
        prefxicon: AssetPaths.USER_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        controller: editPrfileController.usernameController,
          // ..text = editPrfileController.storage.username,
        onsave: (value) {
          editPrfileController.username = value!;
        },
        // onchange: (val){},
        onchange: (changevalue) {
          editPrfileController.usernamecolor.value = changevalue;
        },
        colorOff: editPrfileController.usernamecolor.value.isNotEmpty
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
        controller: editPrfileController.emailController,
          // ..text = editPrfileController.storage.useremail,
        onsave: (value) {
          editPrfileController.email = value!;
        },
        onchange: (changevalue) {
          editPrfileController.emailcolor.value = changevalue;
        },
        colorOff: editPrfileController.emailcolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.validateEmail(value!);
        });
  }

  Widget positionDorpDownWidget() {
    return CustomDropdownField(
      value: editPrfileController.program.value,
      Itemsss: AppStrings.ASD,
      onchange: (newItem) {
        editPrfileController.program.value = newItem.toString();
        editPrfileController.programcolor.value = newItem.toString();
      },
      colorOff: editPrfileController.programcolor.value.isNotEmpty
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
        controller: editPrfileController.addressController,
          // ..text = editPrfileController.storage.address,
        onsave: (value) {
          editPrfileController.address = value!;
        },
        onchange: (changevalue) {
          editPrfileController.addresscolor.value = changevalue;
        },
        colorOff: editPrfileController.addresscolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.valiadteEmpty(value!);
        });
  }

  Widget bioWidget() {
    return CustomTextField(
        hint: AppStrings.BIO_FIELD_TEXT,
        prefxicon: AssetPaths.LOCK_ICON,
        prefixIconSize: 22.w,
        prefixRIghtPadding: 15.w,
        sufixRIghtPadding: 1.w,
        lines: 4,
        controller: editPrfileController.bioController,
          // ..text = editPrfileController.storage.bio,
        onsave: (value) {
          editPrfileController.bio = value!;
        },
        onchange: (changevalue) {
          editPrfileController.biocolor.value = changevalue;
        },
        colorOff: editPrfileController.biocolor.value.isNotEmpty
            ? AppColors.PRIMARY_COLOR
            : AppColors.GREY_COLOR,
        validator: (value) {
          return FieldValidator.valiadteEmpty(value!);
        });
  }

  Widget updateButtonWidget() {
    return CustomButton(
        text: AppStrings.UPDATE_BUTTON_TEXT,
        onclick: () {
          // Get.offNamed(Paths.FAVORITES_SCREEN_ROUTE);
          // Get.offNamed(Paths.MESSAGES_SCREEN_ROUTE);

          editPrfileController.editProfile();
        });
  }
}
