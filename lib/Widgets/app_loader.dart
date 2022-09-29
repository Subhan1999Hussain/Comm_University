import 'package:bot_toast/bot_toast.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const SpinKitFadingCircle(
        duration: Duration(milliseconds: 500),
        color: AppColors.BLACK_COLOR,
        size: 50.0);
  }
}

showLoading() {
  BotToast.showCustomLoading(toastBuilder: (close) {
    return AppLoader();
  });
}

stopLoading() {
  BotToast.closeAllLoading();
}
