import 'package:communiversity/Events_Module/Screens/event_upcoming_previous_screen.dart';
import 'package:communiversity/Game_Module/Screens/game_screen.dart';
import 'package:communiversity/Events_Module/Screens/home_screen.dart';
import 'package:communiversity/Profile_Module/Screens/profile_screen.dart';
import 'package:communiversity/Widgets/custom_app_header.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  bool search = true;
  bool arCamera = false;

  Widget? headChild;
  static const List title_LIST = ["Home", "Game", "Events", "Profile"];
  final pages = [
    HomeScreen(),
    GameScreen(),
    EventUpcomingPreviousScreen(),
    ProfileScreen()
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,

      backgroundColor: AppColors.LIGHT_GREY_COLOR,
      body: Column(children: [
        CustomAppHeader(
          headChild: arCamera != false
              ? CustomText(
                  maintext: AppStrings.AR_CAMERA_WITH_COIN_ON_THE_TRACK_TEXT,
                  is_alignLeft: false,
                  color: AppColors.WHITE_COLOR,
                )
              : null,
          title: title_LIST[pageIndex],
          leading: AssetPaths.DRAWER_ICON,
          onclickLead: () => ZoomDrawer.of(context)!.toggle(),
          action: AssetPaths.NOTIFICATION_ICON,
          onclickAction: () {
            Get.offNamed(Paths.EVENT_DETAIL_SCREEN_ROUTE);
          },
          is_search: search,
        ),
        Expanded(child: pages[pageIndex]),
      ]),

      //----------------Bottom Navigation Bar----------------
      bottomNavigationBar: bottomNavigationBarWidget(),
    );
  }

  Widget bottomNavigationBarWidget() {
    return Container(
      height: 45.h,
      color: AppColors.WHITE_COLOR,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        //----------------Home Menu----------------
        homeWidget(),
        //----------------Game Menu----------------
        gameWidget(),
        //----------------Event Menu----------------
        eventWidget(),
        //----------------Profile Menu----------------
        profileWidget(),
      ]),
    );
  }

  Widget homeWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          search = true;
          arCamera = false;
          pageIndex = 0;
        });
      },
      child: pageIndex == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                    height: 5,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.PRIMARY_COLOR),
                  ),
                  Image.asset(AssetPaths.HOME_SELECTED_ICON,
                      color: AppColors.PRIMARY_COLOR, scale: 3.w),
                  SizedBox()
                ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                      height: 5,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.WHITE_COLOR)),
                  Image.asset(AssetPaths.HOME_UNSELECTED_ICON, scale: 3.w),
                  SizedBox()
                ]),
    );
  }

  Widget gameWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          search = false;
          arCamera = true;

          pageIndex = 1;
        });
      },
      child: pageIndex == 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                      height: 5,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.PRIMARY_COLOR)),
                  Image.asset(AssetPaths.GAME_SELECTED_ICON,
                      color: AppColors.PRIMARY_COLOR, scale: 3.w),
                  SizedBox()
                ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                      height: 5,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.WHITE_COLOR)),
                  Image.asset(AssetPaths.GAME_UNSELECTED_ICON, scale: 3.w),
                  SizedBox()
                ]),
    );
  }

  Widget eventWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          search = true;
          arCamera = false;

          pageIndex = 2;
        });
      },
      child: pageIndex == 2
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                      height: 5,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.PRIMARY_COLOR)),
                  Image.asset(AssetPaths.EVENT_SELECTED_ICON,
                      color: AppColors.PRIMARY_COLOR, scale: 3.w),
                  SizedBox()
                ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                      height: 5,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.WHITE_COLOR)),
                  Image.asset(AssetPaths.EVENT_UNSELECTED_ICON, scale: 3.w),
                  SizedBox()
                ]),
    );
  }

  Widget profileWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          search = false;
          arCamera = false;

          pageIndex = 3;
        });
      },
      child: pageIndex == 3
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                      height: 5,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.PRIMARY_COLOR)),
                  Image.asset(AssetPaths.USER_ICON,
                      color: AppColors.PRIMARY_COLOR, scale: 3.w),
                  SizedBox()
                ])
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                      height: 5,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.WHITE_COLOR)),
                  Image.asset(AssetPaths.USER_TRANSPARENT_ICON, scale: 3.w),
                  SizedBox()
                ]),
    );
  }
}
