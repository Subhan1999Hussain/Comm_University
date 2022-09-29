import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TarHeelTracks extends StatefulWidget {
  const TarHeelTracks({Key? key}) : super(key: key);

  @override
  State<TarHeelTracks> createState() => _TarHeelTracksState();
}

class _TarHeelTracksState extends State<TarHeelTracks> {
  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_TRANSPARENT_ICON,
        onclickLead: () {
          Get.back();
        },
        title: AppStrings.MY_TAR_HEEL_TRACKS_TEXT,
        headChild: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              maintext: AppStrings.AMOUNT_TEXT,
              is_alignLeft: false,
              color: AppColors.WHITE_COLOR,
            ),
            CustomText(
              maintext: AppStrings.TOTAL_TAR_HEEL_TRACK_TEXT,
              is_alignLeft: false,
              color: AppColors.WHITE_COLOR,
            ),
            CustomText(
              maintext: AppStrings.REDEEM_BUTTON_TEXT,
              is_alignLeft: false,
              color: AppColors.WHITE_COLOR,
              is_underline: true,
            ),
          ],
        ),
        bodyChild: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: screeen_padding.screenPadding),
          child: Column(
            children: [
              //----------------Email Address Field----------------
              redeemedTarHeelsWidget(),
              SizedBox(height: 10.h),
              redeemListWidget(),
            ],
          ),
        ));
  }

  Widget redeemedTarHeelsWidget() {
    return CustomText(
        maintext: AppStrings.REDEEMED_TAR_HEELS_TEXT,

        // fontsize: 22.sp,
        fontWeight: FontWeight.bold);
  }

  Widget redeemcontainerWidget(onTap, date, steps) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Paths.REDEEM_SCREEN_ROUTE);
      },
      child: Container(
        width: 1.sw,
        // color: AppColors.WHITE_COLOR,
        decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            children: [
              CustomText(maintext: date, fontsize: 15.sp),
              Spacer(),
              Image.asset(
                AssetPaths.HEEL_ICON,
                scale: 2,
              ),
              CustomText(
                  maintext: steps,
                  fontsize: 15.sp,
                  fontWeight: FontWeight.bold),
              Spacer(),
              CustomText(
                maintext: AppStrings.COFFEE_SHOP_TEXT,
                fontsize: 15.sp,
                is_underline: true,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget redeemListWidget() {
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          // shrinkWrap: true,
          itemCount: 40,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: redeemcontainerWidget(
                  () {}, AppStrings.DATE_TEXT, AppStrings.STEPS_NUMBER_TEXT),
            );
          }),
    );
  }
}
