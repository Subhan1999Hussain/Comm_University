import 'package:communiversity/Events_Module/Controller/home_controller.dart';
import 'package:communiversity/Events_Module/Custom_Widget/custom_event_container.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final EventsController homeEventController = Get.put(EventsController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: screeen_padding.screenPadding),
        child: Obx(
          () => Column(
            children: [
              Row(
                children: [
                  CustomText(
                    maintext: "Hi " + homeEventController.storage.username,
                    color: AppColors.BLACK_COLOR,
                    fontWeight: FontWeight.bold,
                    fontsize: 20.sp,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    AssetPaths.GREETING_ICON,
                    scale: 2.5,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                maintext: AppStrings.CURRENT_EVENT_TEXT,
                color: AppColors.BLACK_COLOR,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),

              // Container(
              //   width: 1.sw,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 10,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: const EdgeInsets.only(right: 15.0),
              //           child: CustomEventContainer(),
              //         );
              //       }),
              // ),
              currentEventWidget(),
              // CustomEventContainer(),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                maintext: AppStrings.UPCOMING_EVENTS_BUTTON_TEXT,
                color: AppColors.BLACK_COLOR,
                fontsize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 100,
              //   color: AppColors.RED_COLOR,
              //   child: const
              upcomingEventWidget(),
              SizedBox(
                height: 25,
              ),
              // CustomEventContainer(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget currentEventWidget() {
    return
        // ? CustomText(maintext: "No Data", is_alignLeft: false,
        //       color: AppColors.GREY_COLOR)
        // :

        Container(
      height: 0.36.sh,
      child: ListView.builder(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeEventController.currentEvents.value.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                  width: 0.9.sw,
                  child: CustomEventContainer(
                    eventName: homeEventController
                        .currentEvents.value[index].eventName!,
                    date: homeEventController.dateConverter(homeEventController
                        .currentEvents.value[index].eventDate!),
                    image: homeEventController
                        .currentEvents.value[index].eventPictures!,
                    location: homeEventController
                        .currentEvents.value[index].eventLocation!.location,
                    time: homeEventController
                        .currentEvents.value[index].eventTime!
                        .toUpperCase(),
                    details: homeEventController
                        .currentEvents.value[index].eventDescription!,
                    onTap: () {
                      Get.toNamed(Paths.EVENT_DETAIL_SCREEN_ROUTE,
                          arguments:
                              homeEventController.currentEvents.value[index]);
                    },
                  )),
            );
          }),
    );
  }

  Widget upcomingEventWidget() {
    return
        // ? CustomText(maintext: "No Data", is_alignLeft: false,
        //       color: AppColors.GREY_COLOR)
        // :
        Container(
      // width: 0.5.s
      height: 0.223.sh,
      // height: 0.8.sh,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeEventController.upcomingEvents.value.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                  width: 200.w,
                  child: CustomEventContainer(
                    eventName: homeEventController
                        .upcomingEvents.value[index].eventName!,
                    date: homeEventController.dateConverter(homeEventController
                        .upcomingEvents.value[index].eventDate!),
                    image: homeEventController
                        .upcomingEvents.value[index].eventPictures!,
                    details: homeEventController
                        .upcomingEvents.value[index].eventDescription!,
                    isUpcoming: true,
                    height: 0.17.sh,
                    onTap: () {
                      Get.toNamed(Paths.EVENT_DETAIL_SCREEN_ROUTE,
                          arguments:
                              homeEventController.upcomingEvents.value[index]);
                    },
                  )),
            );
          }),
    );
  }
}
