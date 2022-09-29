import 'package:communiversity/Drawer_Module/Custom_Widget/menu_item.dart';
import 'package:communiversity/Widgets/app_fancy_image.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuScreen extends StatelessWidget {
  Storagedata stroage = Storagedata();
  final mymenuItem currentItem;
  final ValueChanged onSelectedItem;
  MenuScreen(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Spacer(),
          SizedBox(
            height: 0.05.sh,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 0.20.sw,
                height: 0.10.sh,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 183, 171),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: stroage.profilepic != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: AppFancyImage(
                            image: NetworkStrings.baseUrl + stroage.profilepic,
                            is_proile: true),
                      )
                    : Image.asset(
                        AssetPaths.AVATAR_IMAGE,
                      ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        maintext: stroage.username,
                        color: AppColors.WHITE_COLOR,
                        fontWeight: FontWeight.bold),
                    CustomText(
                      maintext: stroage.useremail,
                      color: AppColors.WHITE_COLOR,
                      fontsize: 12.sp,
                    ),
                    CustomText(
                      maintext: stroage.address,
                      color: AppColors.WHITE_COLOR,
                      fontsize: 12.sp,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 0.05.sh,
          ),
          ...MyMenuItems.all.map(buildMenuItem).toList(),
          Spacer(
            flex: 1,
          ),
        ],
      )),
    );
  }

  Widget buildMenuItem(mymenuItem item) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        // topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
        // bottomLeft: Radius.circular(10)
      )),
      selectedTileColor: Color.fromARGB(255, 14, 94, 94),
      selected: currentItem == item,
      minLeadingWidth: 20,
      leading: Image.asset(item.icon_image, scale: 3),
      title: CustomText(maintext: item.title, color: AppColors.WHITE_COLOR),
      onTap: () {
        onSelectedItem(item);
      },
    );
  }
}
