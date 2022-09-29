import 'package:communiversity/Widgets/app_fancy_image.dart';
import 'package:communiversity/Widgets/custom_button.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/Services/network_strings.dart';

class ProfileScreen extends StatelessWidget {
  Storagedata storage = Storagedata();
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: screeen_padding.screenPadding),
        child: Column(children: [
          // SizedBox(height: 0.02.h),
          profileicWidget(),
          SizedBox(
            height: 30.h,
          ),
          labelWidget(AppStrings.NAME_TEXT),
          SizedBox(height: 3.h),

          fullNameWidget(),
          SizedBox(height: 15.h),

          labelWidget(AppStrings.EMAIL_FIELD_TEXT),
          SizedBox(height: 3.h),

          emailAddressWidget(),
          SizedBox(height: 15.h),

          labelWidget(AppStrings.PROGRAM_ENROLLED_TEXT),
          SizedBox(height: 3.h),

          programEnrolledWidget(),
          SizedBox(height: 15.h),

          labelWidget(AppStrings.ADDRESS_FIELD_TEXT),
          SizedBox(height: 3.h),

          addressWidget(),
          SizedBox(height: 15.h),

          labelWidget(AppStrings.BIO_FIELD_TEXT),
          SizedBox(height: 3.h),

          bioWidget(),
          SizedBox(height: 15.h),
          editProfileWidget(),
          SizedBox(height: 15.h),
        ]),
      ),
    );
  }

  Widget profileicWidget() {
    return storage.profilepic != null
        ? Container(
            width: 140.0,
            height: 140.0,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.PRIMARY_COLOR, width: 5.w),
                shape: BoxShape.circle),
            child: ClipOval(
              child: AppFancyImage(
                  image: NetworkStrings.baseUrl + storage.profilepic,
                  is_proile: true),
            ))
        : CircleAvatar(
            radius: 63.sp,
            backgroundColor: AppColors.PRIMARY_COLOR,
            child: CircleAvatar(
                backgroundImage: const AssetImage(AssetPaths.AVATAR_IMAGE),
                radius: 63.sp));

    // CircleAvatar(
    //     radius: 69.sp,
    //     backgroundColor: AppColors.PRIMARY_COLOR,
    //     child: CircleAvatar(
    //         backgroundImage: const AssetImage(AssetPaths.AVATAR_IMAGE),
    //         radius: 63.sp));
  }

  Widget labelWidget(mainLabel) {
    return CustomText(
      fontsize: 20.sp,
      maintext: mainLabel, fontWeight: FontWeight.bold,
      // color: AppColors.PURPLE_COLOR
    );
  }

  Widget fullNameWidget() {
    return CustomText(
      maintext: storage.username,
      // color: AppColors.PURPLE_COLOR
    );
  }

  Widget emailAddressWidget() {
    return CustomText(
      maintext: storage.useremail,
    );
  }

  Widget programEnrolledWidget() {
    return CustomText(
      maintext: storage.program,
      // color: AppColors.PURPLE_COLOR
    );
  }

  Widget addressWidget() {
    return CustomText(
      maintext: storage.address,
      // color: AppColors.PURPLE_COLOR
    );
  }

  Widget bioWidget() {
    return CustomText(
      maintext: storage.bio,
      // color: AppColors.PURPLE_COLOR
    );
  }
Widget editProfileWidget() {
    return CustomButton(
              text: AppStrings.EDIT_PROFILE_BUTTON_TEXT,
              onclick: () {
                Get.toNamed(Paths.EDIT_PROFILE_SCREEN_ROUTE);
              });
  }


  
}
