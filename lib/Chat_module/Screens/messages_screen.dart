import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Widgets/custom_message_container.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      leading: AssetPaths.BACK_TRANSPARENT_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.MESSAGES_TEXT,
      bodyChild: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: screeen_padding.screenPadding,
                  right: screeen_padding.screenPadding),
              child: Column(
                children: [
                  CustomMessageContainer(
                      name: AppStrings.FRANK_JORDAN_TEXT,
                      message: AppStrings.LOREM_IPSUM_TEXT,
                      image: AssetPaths.AVATAR_IMAGE,
                      onTap: () {
                        Get.toNamed(Paths.NOTIFICATIONS_SCREEN_ROUTE);
                      }),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: AppColors.GREY_COLOR,
                  )
                ],
              ),
            );
          }),
    );
  }
}
