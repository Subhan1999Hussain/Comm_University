import 'dart:async';
import 'dart:convert';
import 'package:communiversity/Drawer_Module/Model/logout_model.dart';
import 'package:communiversity/Widgets/app_loader.dart';
import 'package:communiversity/Widgets/app_snackbar.dart';
import 'package:communiversity/utils/Routes/app_pages.dart';
import 'package:communiversity/utils/Services/api_services.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  Storagedata storage = Storagedata();
  //----------------------------------LogOut Api---------------------------------
  Future<void> logOut() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = storage.id;
    try {
      var response =
          await ApiService.post(NetworkStrings.logoutEndpoint, data, true)
              .timeout(
        const Duration(seconds: 20),
      );
      var values = jsonDecode(response!.body);
      var obj = LogoutModel.fromJson(values);

      if (response.statusCode == 200) {
        AppSnackBar(obj.message!);
       
        storage.clearUser();
       
        //------------------------Go to Pre Login-----------------------
        Get.offAllNamed(Paths.LOGIN_SCREEN_ROUTE);
      } else {
        AppSnackBar(obj.message!);
      }
    } on TimeoutException catch (_) {
      stopLoading();
      AppSnackBar("Server Problem");
    } catch (_) {
      stopLoading();
      print(_);
      AppSnackBar("App is not working correct contact Admin");
    }
  }
}
