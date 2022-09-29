import 'package:communiversity/Widgets/app_fancy_image.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMessageContainer extends StatelessWidget {
  final String name, message, image;
  // final double location;
  void Function()? onTap;
  CustomMessageContainer({
    Key? key,
    required this.name,
    required this.image,
    required this.message,
    // required this.location,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        //----------------Image Container----------------
        imageContainerWidget(),
        SizedBox(width: 10.w),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //----------------Job Title Text----------------
            nameWidget(),
            const SizedBox(height: 8.0),
            messageWidget(),
            // SizedBox(width: 10.w),
          ]),
        ),
        const SizedBox(width: 5.0),
      ]),
    );
  }

  Widget imageContainerWidget() {
    return Container(
        width: 50.w,
        height: 50.h,
        // color: AppColors.PRIMARY_COLOR,
        decoration: BoxDecoration(
          color: AppColors.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image)),
        )
        // child: Image.asset(AssetPaths.AVATAR_IMAGE),
        );
  }

  Widget nameWidget() {
    return CustomText(
        maintext: name,fontWeight: FontWeight.bold, );
  }

  Widget messageWidget() {
    return CustomText(
        maintext:
            message,
        fontsize: 15.sp,
        maxline: 2,
        );
  }
}
