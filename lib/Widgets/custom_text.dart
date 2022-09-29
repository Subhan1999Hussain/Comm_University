import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  String? maintext;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontsize;
  final double? letterSpacing;
  int? maxline;
  bool is_alignLeft;
  bool is_underline;
  CustomText({
    Key? key,
    this.maintext,
    this.color,
    this.fontWeight,
    this.fontsize,
    this.letterSpacing,
    this.maxline,
    this.is_alignLeft = true,
    this.is_underline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);

    return Align(
      alignment: is_alignLeft ? Alignment.centerLeft : Alignment.center,
      child: Text(
        maxLines: maxline ?? defaultTextStyle.maxLines,
        overflow:
            maxline != null ? TextOverflow.ellipsis : TextOverflow.visible,
        textAlign: is_alignLeft != false ? TextAlign.left : TextAlign.center,
        maintext ?? "",
        style: TextStyle(
          letterSpacing: letterSpacing ?? 0,
          decoration: is_underline != true
              ? TextDecoration.none
              : TextDecoration.underline,
          fontSize: fontsize ?? 18.sp,
          color: color,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
