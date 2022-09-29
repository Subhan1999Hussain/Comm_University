import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            title: 'Comm University',
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
            theme: ThemeData(
              fontFamily: AppStrings.FONT_ROBOTO,
              primarySwatch: Colors.blue,
            ),
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
