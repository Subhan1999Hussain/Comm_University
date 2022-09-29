import 'package:communiversity/Splash/Controller/splash_controller.dart';
import 'package:communiversity/Widgets/app_animation.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/assets_path.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.SPLASH_COLOR,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image(AssetPaths.SPLASH_1_IMAGE, 0.6.sw),
          Center(
              child: AppAnimation(
                  child: image(AssetPaths.SPLASH_LOGO_IMAGE, 0.7.sw))),
          image(AssetPaths.SPLASH_2_IMAGE, 1.sw)
        ],
      ),
    );
  }

  Widget image(path, width) {
    return Image.asset(path, width: width);
  }
}
