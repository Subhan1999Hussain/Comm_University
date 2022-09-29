import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ticket_widget/ticket_widget.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_TRANSPARENT_ICON,
        onclickLead: () {
          Get.back();
        },
        title: AppStrings.REDEEM_TEXT,
        bodyChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              //----------------Email Address Field----------------
              SizedBox(
                height: 20.h,
              ),
              imageWidget(),
              textWidget(AppStrings.REDEEM_YOUR_COINS_TEXT, FontWeight.bold),
              SizedBox(height: 50.h),
              textWidget(
                  AppStrings
                      .SHOW_THIS_CODE_AT_THE_COUNTER_TO_AVAIL_THE_DISCOUNT_TEXT,
                  FontWeight.normal),
              SizedBox(height: 90.h),
              discountTicketWidget()

              // redeemListWidget(),
            ],
          ),
        ));
  }

  Widget imageWidget() {
    return Image.asset(AssetPaths.HEEL_ICON);
  }

  Widget textWidget(text, weight) {
    return CustomText(
        maintext: text,
        is_alignLeft: false,
        // fontsize: 22.sp,
        fontWeight: weight);
  }

  Widget discountTicketWidget() {
    return TicketWidget(
      width: 1.sw,
      height: 60.h,
      isCornerRounded: true,
      color: AppColors.PRIMARY_COLOR,
      // padding: EdgeInsets.all(90),
      child: CustomText(
          maintext: "59032",
          color: AppColors.WHITE_COLOR,
          is_alignLeft: false,
          fontsize: 30.sp,
          letterSpacing: 25.sp),
    );
  }
}
