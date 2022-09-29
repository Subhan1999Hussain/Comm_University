import 'dart:io';
import 'package:communiversity/Auth_Module/custom_widget/custom_bottom_sheet.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// File? pickedFile;
// final box = GetStorage();

class ProfileStack extends StatelessWidget {
  void Function()? ontapCamera;
  void Function()? ontapGallery;
  String? imagePath, profilePicPath;
  RxBool? profilePicPathSet;
  dynamic controller;
  ProfileStack(
      {Key? key,
      this.ontapCamera,
      this.ontapGallery,
      this.imagePath,
      this.controller,
      this.profilePicPathSet,
      this.profilePicPath})
      : super(key: key);

  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 150.h,
      child: Stack(children: [
        //----------------Profile Pic----------------
        profilePicWidget(),
        //----------------Upload Container----------------
        uploadIconWidget(context),
      ]),
    );
  }

  bottomsheet(BuildContext context) {
    return CustomBottomSheet(
      camera: ontapCamera, gallery: ontapGallery,
      // camera:
      // () {
      //   controller.imagePick.takephoto(ImageSource.camera);
      // },
      // gallery:
      // () {
      //   controller.imagePick.takephoto(ImageSource.gallery);
      // },
    );
  }

  Widget profilePicWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.PRIMARY_COLOR, width: 5.w),
        shape: BoxShape.circle,
        image: DecorationImage(
            scale: 3.sp,
            image: profilePicPathSet == true
                ? FileImage(File(profilePicPath!))
                : box.read("profilePicture") == null
                    ? const AssetImage(AssetPaths.AVATAR_IMAGE)
                    : NetworkImage(
                        NetworkStrings.baseUrl + box.read("profilePicture"),
                      ) as ImageProvider,
            fit: BoxFit.cover),
      ),
    );
    // Container(
    //   decoration: BoxDecoration(
    //     border: Border.all(color: AppColors.PRIMARY_COLOR, width: 5.w),
    //     shape: BoxShape.circle,
    //     image: DecorationImage(
    //         scale: 3.sp,
    //         image: AssetImage(AssetPaths.AVATAR_IMAGE),
    //         fit: BoxFit.cover),
    //   ),
    // );
  }

  Widget uploadIconWidget(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 9.0.h),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => bottomsheet(context));
          },
          child: Container(
            width: 40.0.w,
            height: 40.0.h,
            decoration: BoxDecoration(
              color: AppColors.WHITE_COLOR,
              shape: BoxShape.circle,
              image: DecorationImage(
                scale: 5.w,
                image: const AssetImage(AssetPaths.UPLOAD_ICON),
              ),
              border: Border.all(color: AppColors.PRIMARY_COLOR, width: 3.w),
            ),
          ),
        ),
      ),
    );
  }

  // void takephoto(ImageSource source) async {
  //   final pickedImage =
  //       await imagePicker.pickImage(source: source, imageQuality: 25);
  //   _cropImage(pickedImage!.path);
  // }

  // void _cropImage(filePath) async {
  //   final croppedImage = await ImageCropper().cropImage(
  //     sourcePath: filePath,
  //     maxWidth: 1080,
  //     maxHeight: 1080,
  //   );
  //   // pickedFile = File(croppedImage!.path);
  //   // controller.setprofilepath(pickedFile!.path);
  //   Get.back();
  // }
}
