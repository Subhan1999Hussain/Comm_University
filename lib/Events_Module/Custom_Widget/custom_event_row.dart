import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEventRow extends StatelessWidget {
  String? time, location;
  String eventName;
  bool? isFav, isUpcoming;
  CustomEventRow({Key? key, this.isFav = false, this.isUpcoming = false,this.time,this.location,required this.eventName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                maintext: eventName,
                color: AppColors.BLACK_COLOR,
                fontsize: 15.sp,
              ),
              const SizedBox(
                height: 7,
              ),
              isUpcoming != true
                  ? Row(
                      children: [
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Image.asset(
                          AssetPaths.LOCATION_ICON,
                          scale: 3,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            maintext: location,
                            color: AppColors.BLACK_COLOR,
                            fontsize: 12.sp),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          AssetPaths.CLOCK_EVENT_ICON,
                          scale: 3,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            maintext: time,
                            color: AppColors.BLACK_COLOR,
                            fontsize: 12.sp)
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
        isFav == true
            ? Image.asset(AssetPaths.CROSS_ICON, scale: 3)
            : Container()
      ],
    );
  }
}
