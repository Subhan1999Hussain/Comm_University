import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  void Function()? gallery;
  void Function()? camera;
  CustomBottomSheet({Key? key, this.camera, this.gallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.DARK_GREY_COLOR,
      height: 0.13.sh,
      width: double.infinity,
      child: Column(children: [
        InkWell(
          onTap: camera,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 8.0, right: 8.0, bottom: 5.0),
            child: Row(children: [
              const Icon(Icons.camera_alt_sharp, color: AppColors.WHITE_COLOR),
              SizedBox(width: 10.h),
              CustomText(maintext: "CAMERA", color: AppColors.WHITE_COLOR),
            ]),
          ),
        ),
        const Divider(color: AppColors.WHITE_COLOR, thickness: 1),
        InkWell(
          onTap: gallery,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 8.0, right: 8.0, bottom: 5.0),
            child: Row(children: [
              const Icon(Icons.image, color: AppColors.WHITE_COLOR),
              SizedBox(width: 10.h),
              CustomText(maintext: "GALLERY", color: AppColors.WHITE_COLOR),
            ]),
          ),
        ),
      ]),
    );
  }
}
