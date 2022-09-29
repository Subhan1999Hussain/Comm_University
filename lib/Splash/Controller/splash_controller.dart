import 'dart:async';

import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () => checkTokenThenNavigate(),
    );
    super.onInit();
  }

  checkTokenThenNavigate() {
    if (box.read("token") != null) {
      //------------------------Go to Main Menu-----------------------
      Get.offNamed(Paths.MAIN_SCREEN_ROUTE);
    } else {
      //------------------------Go to Pre Login-----------------------
      Get.offNamed(Paths.LOGIN_SCREEN_ROUTE);
    }
  }
}
