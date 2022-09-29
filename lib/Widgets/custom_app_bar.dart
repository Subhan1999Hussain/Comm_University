import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  String? title;
  String? leading;
  Function()? onclickLead;
  String? actionText;
  String? action;
  Color? color;
  Function()? onclickAction;
  CustomAppBar(
      {Key? key,
      this.title,
      this.actionText,
      this.action,
      this.leading,
      this.onclickAction,
      this.onclickLead,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.TRANSPARENT_COLOR,
        elevation: 0.0,
        title: Text(
          title ?? "",
          style:
              TextStyle(color: color ?? AppColors.WHITE_COLOR, fontSize: 22.sp),
        ),
        centerTitle: true,
        leading: leading != null
            ?  InkWell(
                    onTap: onclickLead,
                    child: Image.asset(leading!,
                        scale: 2.5.w, alignment: Alignment.center),
                  )
              
            : const SizedBox(),
        actions: [
          action != null
              ? InkWell(
                  onTap: onclickAction,
                  child: actionText != null
                      ? Padding(
                          padding: EdgeInsets.only(right: 8.0.w),
                          child: CustomText(
                              maintext: actionText,
                              color: color ?? AppColors.WHITE_COLOR),
                        )
                      : Image.asset(action!,
                          scale: 2.5.w, alignment: Alignment.center),
                )
              : const SizedBox(),
        ]);
  }
}
