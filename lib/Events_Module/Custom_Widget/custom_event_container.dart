import 'package:communiversity/Events_Module/Custom_Widget/custom_event_row.dart';
import 'package:communiversity/Widgets/app_fancy_image.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomEventContainer extends StatelessWidget {
  bool? isFav, isUpcoming;
  String date, eventName, details;
  List<String>? image;
  String? time, location;
  double? height;
  void Function()? onTap;
  CustomEventContainer(
      {Key? key,
      this.isFav = false,
      this.isUpcoming = false,
      required this.date,
      required this.image,
      required this.eventName,
      this.location,
      required this.details,
      this.height,
      required this.onTap,
      this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 1.sw,
        // height: 0.38.sh,
        // color: AppColors.WHITE_COLOR,
        decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(alignment: Alignment.topRight, children: [
              // Container(NetworkStrings.baseUrl + image,)
              Container(
                height: height ?? 0.28.sh,
                // width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      NetworkStrings.baseUrl + image![0],
                      // AssetPaths.HOME_IMAGE,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // child: ClipRRect(
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(10),
              //         topRight: Radius.circular(10)),
              //     child: AppFancyImage(
              //         image: NetworkStrings.baseUrl + image,
              //         is_proile: false))),
              Container(
                // height: 20,
                width: 0.1.sw,
                decoration: const BoxDecoration(
                    color: AppColors.PRIMARY_COLOR,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: CustomText(
                    maintext: date,
                    fontsize: 14.sp,
                    color: AppColors.WHITE_COLOR,
                    is_alignLeft: false,
                  ),
                ),
              ),
            ]),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomEventRow(
                  eventName: eventName,
                  location: location,
                  time: time,
                  isFav: isFav,
                  isUpcoming: isUpcoming,
                )),
            // const SizedBox(
            //   height: 15,
            // ),
          ],
        ),
      ),
    );
  }
}
