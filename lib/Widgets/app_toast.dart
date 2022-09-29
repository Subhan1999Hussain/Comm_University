import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  AppToast(String toastmsg) {
    Fluttertoast.showToast(msg: toastmsg, toastLength: Toast.LENGTH_LONG);
  }
}
