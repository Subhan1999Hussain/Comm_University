import 'package:communiversity/Events_Module/Controller/home_controller.dart';
import 'package:communiversity/Events_Module/Model/event_model.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_strings.dart';

class EventDetail extends StatefulWidget {
  EventDetail({Key? key}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  final EventsController homeEventController = Get.find();
  late dynamic args;
  late Events eventDetails;
  @override
  void initState() {
    args = Get.arguments;
    eventDetails = args;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
        leading: AssetPaths.BACK_TRANSPARENT_ICON,
        onclickLead: () {
          Get.back();
        },
        action: AssetPaths.FAVOURITE_ICON,
        onclickAction: () {},
        // title: AppStrings.SIGN_UP_MAIN_TEXT,
        headimagesList: eventDetails.eventPictures!
        // [
        //   AssetPaths.EVENT_IMAGE,
        //   AssetPaths.EVENT_IMAGE,
        //   AssetPaths.EVENT_IMAGE,
        //   AssetPaths.EVENT_IMAGE
        // ]
        ,
        // headImagePath: AssetPaths.BACKGROUND_SIGNUP_IMAGE,
        bodyChild: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: screeen_padding.screenPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        maintext: eventDetails.eventName,
                        color: AppColors.BLACK_COLOR,
                        // fontsize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Image.asset(
                          AssetPaths.CALENDER_ICON,
                          scale: 3,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            maintext: eventDetails.eventDate,
                            color: AppColors.BLACK_COLOR,
                            fontsize: 15.sp),
                        SizedBox(
                          width: 30.w,
                        ),
                        Image.asset(
                          AssetPaths.CLOCK_EVENT_ICON,
                          scale: 3,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            maintext: eventDetails.eventTime,
                            color: AppColors.BLACK_COLOR,
                            fontsize: 15.sp)
                      ]),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                        maintext: eventDetails.eventDescription,
                        maxline: 4,
                        fontsize: 15.sp,
                      )
                    ]),
              ),
              SizedBox(
                height: 20.h,
              ),
              Image.asset(AssetPaths.MAP_IMAGE),
            ],
          ),
        ));
  }
}
