import 'package:communiversity/BottomNavBar_Module/Screens/bottom_nav_bar.dart';
import 'package:communiversity/Chat_module/Screens/messages_screen.dart';
import 'package:communiversity/Drawer_Module/Controller/logout_controller.dart';
import 'package:communiversity/Drawer_Module/Custom_Widget/menu_item.dart';
import 'package:communiversity/Drawer_Module/Screens/menu_screen.dart';
import 'package:communiversity/Favorites_Module/Screen/favorites_screen.dart';
import 'package:communiversity/Redeem_Module/Screens/tar_heel_tracks.dart';
import 'package:communiversity/Settings_Module/Screens/settings_screen.dart';
import 'package:communiversity/Terms_Privacy_Module/Screens/privacy_policy.dart';
import 'package:communiversity/Terms_Privacy_Module/Screens/terms_condition.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class DrawerNav extends StatefulWidget {
  DrawerNav({Key? key}) : super(key: key);

  @override
  State<DrawerNav> createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  final LogoutController logoutController = Get.put(LogoutController());

  mymenuItem currentItem = MyMenuItems.home;
  Widget? getScreen(context) {
    switch (currentItem) {
      case MyMenuItems.home:
        ZoomDrawer.of(context)!.close();
        break;
      case MyMenuItems.tar_heel:
        Get.to(TarHeelTracks());
        break;

      case MyMenuItems.messages:
        Get.to(MessagesScreen());
        break;

      case MyMenuItems.favorites:
        Get.to(FavoritesScreen());
        break;

      case MyMenuItems.settings:
        Get.to(SettingsScreen());
        break;

      case MyMenuItems.terms_Condition:
        Get.to(TermsCondition());
        break;

      case MyMenuItems.privacy_Policy:
        Get.to(PrivacyPolicy());
        break;

      case MyMenuItems.signout:
        logoutController.logOut();

        break;
      default:
        Get.to(BottomNavBar());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      menuScreenTapClose: true,
      borderRadius: 28.0,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 10,
          blurRadius: 8,
        ),
      ],
      menuBackgroundColor: AppColors.PRIMARY_COLOR,
      mainScreen: BottomNavBar(),
      menuScreen: Builder(builder: (context) {
        return MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
              });
              getScreen(context);
            });
      }),
    );
  }
}
