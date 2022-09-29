import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  String? btnimg;
  Color? color;
  final Color? textcolor;
  final double? fontsize, height, iconsize;
  bool? is_gradient;
  final Function()? onclick;

  CustomButton(
      {Key? key,
      required this.text,
      this.btnimg,
      this.color,
      this.fontsize,
      this.height,
      this.iconsize,
      this.textcolor,
      this.is_gradient = true,
      this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: height ?? 0.07.sh,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(35),
        ),
        child: ElevatedButton(
          onPressed: onclick,
          style: ElevatedButton.styleFrom(
              primary: AppColors.TRANSPARENT_COLOR,
              onSurface: AppColors.TRANSPARENT_COLOR,
              shadowColor: AppColors.TRANSPARENT_COLOR),
          child: Text(
            text,
            style: TextStyle(
                color: textcolor ?? AppColors.WHITE_COLOR,
                fontSize: fontsize ?? 18.sp),
          ),
        ),
      ),
    );
  }
}
