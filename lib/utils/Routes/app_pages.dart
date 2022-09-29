import 'package:communiversity/Auth_Module/Screens/otp_verification.dart';
import 'package:communiversity/Auth_Module/Screens/signup.dart';
import 'package:communiversity/BottomNavBar_Module/Screens/bottom_nav_bar.dart';
import 'package:communiversity/Chat_module/Screens/messages_screen.dart';
import 'package:communiversity/Drawer_Module/Screens/drawer_nav.dart';
import 'package:communiversity/Events_Module/Screens/event_detail.dart';
import 'package:communiversity/Favorites_Module/Screen/favorites_screen.dart';
import 'package:communiversity/Notification_Module/Screens/notification_screen.dart';
import 'package:communiversity/Password_Module/Screens/change_password.dart';
import 'package:communiversity/Password_Module/Screens/forgot_password.dart';
import 'package:communiversity/Password_Module/Screens/reset_password.dart';
import 'package:communiversity/Profile_Module/Screens/edit_profile.dart';
import 'package:communiversity/Redeem_Module/Screens/redeem_screen.dart';
import 'package:communiversity/Redeem_Module/Screens/tar_heel_tracks.dart';
import 'package:communiversity/Settings_Module/Screens/settings_screen.dart';
import 'package:communiversity/Splash/Screens/splash_screen.dart';
import 'package:communiversity/Terms_Privacy_Module/Screens/privacy_policy.dart';
import 'package:communiversity/Terms_Privacy_Module/Screens/terms_condition.dart';
import 'package:get/get.dart';

import '../../Auth_Module/Screens/login.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Paths.SPLASH_SCREEN_ROUTE,
      page: () =>  SplashScreen(),
    ),
    GetPage(
      name: Paths.LOGIN_SCREEN_ROUTE,
      page: () => LogIn(),
    ),
    GetPage(
      name: Paths.SIGNUP_SCREEN_ROUTE,
      page: () => SignUp(),
    ),
    GetPage(
      name: Paths.FORGOT_PASSWORD__SCREEN_ROUTE,
      page: () => ForgotPassword(),
    ),
    GetPage(
      name: Paths.OTP_VERIFICATION_SCREEN_ROUTE,
      page: () => OTPVerification(),
    ),
    GetPage(
      name: Paths.RESET_PASSWORD_SCREEN_ROUTE,
      page: () => ResetPassword(),
    ),
    GetPage(
      name: Paths.CHANGE_PASSWORD_SCREEN_ROUTE,
      page: () => ChangePassword(),
    ),
    GetPage(
      name: Paths.MAIN_SCREEN_ROUTE,
      page: () => DrawerNav(),
    ),
    GetPage(
      name: Paths.EDIT_PROFILE_SCREEN_ROUTE,
      page: () => EditProfile(),
    ),
    GetPage(
      name: Paths.FAVORITES_SCREEN_ROUTE,
      page: () => FavoritesScreen(),
    ),
    GetPage(
      name: Paths.MESSAGES_SCREEN_ROUTE,
      page: () => MessagesScreen(),
    ),
    GetPage(
      name: Paths.NOTIFICATIONS_SCREEN_ROUTE,
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: Paths.SETTINGS_SCREEN_ROUTE,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: Paths.TERMS_CONDITION_SCREEN_ROUTE,
      page: () => TermsCondition(),
    ),
    GetPage(
      name: Paths.PRIVACY_POLICY_SCREEN_ROUTE,
      page: () => PrivacyPolicy(),
    ),
    GetPage(
      name: Paths.TAR_HEEL_TRACK_SCREEN_ROUTE,
      page: () => TarHeelTracks(),
    ),
    GetPage(
      name: Paths.REDEEM_SCREEN_ROUTE,
      page: () => RedeemScreen(),
    ),
    GetPage(
      name: Paths.EVENT_DETAIL_SCREEN_ROUTE,
      page: () => EventDetail(),
    ),
    // GetPage(
    //   name: Paths.SETTINGS_SCREEN_ROUTE,
    //   page: () => SettingsScreen(),
    // ),
    // GetPage(
    //   name: Paths.SETTINGS_SCREEN_ROUTE,
    //   page: () => SettingsScreen(),
    // ),
  ];
}
