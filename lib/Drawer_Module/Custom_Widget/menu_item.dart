import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';

class MyMenuItems {
  static const home = mymenuItem(
    "Home",
    AssetPaths.HOME_TRANSPARENT_ICON,
  );
  static   const tar_heel = mymenuItem(
    "Tar Heel Tracks",
    AssetPaths.HEEL_UNSELECTED__ICON,
  );
  static   const messages = mymenuItem(
    "My Messages",
    AssetPaths.MESSAGE_ICON,
  );
  static   const favorites = mymenuItem(
    "Favorites",
    AssetPaths.FAVOURITE_ICON,
  );
  static   const settings = mymenuItem(
    "Settings",
    AssetPaths.SETTING_ICON,
  );
  static   const terms_Condition = mymenuItem(
    "Terms & Conditions",
    AssetPaths.TERMS_ICON,
  );
  static   const privacy_Policy = mymenuItem(
    "Privacy Policy",
    AssetPaths.PRIVACY_ICON,
  );
  static   const signout = mymenuItem(
    "Signout",
    AssetPaths.SIGNOUT_ICON,
  );

  static final all = <mymenuItem>[
    home,
    tar_heel,
    messages,
    favorites,
    settings,
    terms_Condition,
    privacy_Policy,
    signout
  ];
}

class mymenuItem {
  final String? title;
  final String icon_image;
  const mymenuItem(this.title, this.icon_image);
}
