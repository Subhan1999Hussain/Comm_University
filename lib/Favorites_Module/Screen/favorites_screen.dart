import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Widgets/app_template.dart';
import 'package:communiversity/Events_Module/Custom_Widget/custom_event_container.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      leading: AssetPaths.BACK_TRANSPARENT_ICON,
      onclickLead: () {
        Get.back();
      },
      title: AppStrings.FAVORITES_TEXT,
      bodyChild: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: screeen_padding.screenPadding,
                  right: screeen_padding.screenPadding),
              child: CustomEventContainer(eventName: "uuuuuuuuuu",
                    date: "02 Sep",
                    image:
                        ["uploads/eventPictures/2022-09-27T07-31-56.623Z1498199 (2).jpg"],
                    location: "ytyttttt",
                    time: "13:45 AM",isFav: true,
                    details: "frkdf",
                    onTap: (){},
                    ),
            );
          }),
    );
  }
}
