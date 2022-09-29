import 'dart:convert';

import 'package:communiversity/Events_Module/Model/event_model.dart';
import 'package:communiversity/utils/Services/api_services.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:communiversity/utils/storage_data.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventsController extends GetxController {
  // var search = TextEditingController();
  Storagedata storage = Storagedata();
  Rx<List<Events>> currentEvents = Rx<List<Events>>([]);
  Rx<List<Events>> upcomingEvents = Rx<List<Events>>([]);

  // List<UpcomingEvent> upcomingEvents = <UpcomingEvent>[];

  // Rx<List<Jobs>> foundshift = Rx<List<Jobs>>([]);
  // String location = 'No km';
  // double distanceInMeters = 0;
  // RxBool denied = false.obs;
  // late Position position;

  @override
  void onInit() async {
    super.onInit();

    currentEvent();
    upcomingEvent();
  }

//------------------------date Format Convertor-----------------------
  String dateConverter(date) {
    DateTime current = DateTime.parse(date);
    String formattedDate = DateFormat('dd MMM ').format(current);
    return formattedDate;
  }

  // //------------------Searching---------------------
  // void searchArea(String search) {
  //   List<Jobs> results = [];
  //   if (search.isEmpty) {
  //     results = allShifts;
  //   } else {
  //     results = foundshift.value
  //         .where((element) => element.hospitalName
  //             .toString()
  //             .toLowerCase()
  //             .contains(search.toLowerCase()))
  //         .toList();
  //   }
  //   foundshift.value = results;
  // }

  // //------------------Distance in Km---------------------
  // double distanceKm(double la, double lo) {
  //   showLoading();
  //   distanceInMeters = Geolocator.distanceBetween(
  //       position.latitude, position.longitude, lo, la);
  //   stopLoading();

  //   return (distanceInMeters / 1000);
  // }

  // //------------------Filter---------------------
  // void filter(double minimumHourlyRate, double maxmimumDistance) async {
  //   List<Jobs> filter = <Jobs>[];
  //   filter = allShifts
  //       .where((element) =>
  //           element.hourlyRate! > minimumHourlyRate &&
  //           distanceKm(double.parse(element.location!.latitude!),
  //                   double.parse(element.location!.longitude!)) <
  //               maxmimumDistance)
  //       .toList();
  //   foundshift.value = filter;
  // }

  //---------------------------All Shifts Api---------------------------------
  Future<EventModel?> currentEvent() async {
    // try {
    // position = await _getGeoLocationPosition();

    var response =
        await ApiService.get(NetworkStrings.currenteventsEndpont, true)
        //     .timeout(
        //   const Duration(seconds: 20),
        // )
        ;
    var values = jsonDecode(response!.body);
    var obj = EventModel.fromJson(values);
    if (response.statusCode == 200) {
      // denied.value = false;
      currentEvents.value = obj.events!;
      // upcomingEvents.value = obj.upcomingEvent!;
      // foundshift.value = obj.jobs!;
    } else {
      // AppSnackBar(obj.);
    }
    // } on TimeoutException catch (_) {
    //   stopLoading();
    //   AppSnackBar("Server Problem");
    // } catch (_) {
    //   stopLoading();
    //   print(_);
    //   AppSnackBar("App is not working correct contact Admin");
    // }
    return null;
  }

//---------------------------All Shifts Api---------------------------------
  Future<EventModel?> upcomingEvent() async {
    // try {
    // position = await _getGeoLocationPosition();

    var response =
        await ApiService.get(NetworkStrings.upcomingeventsEndpont, true)
        //     .timeout(
        //   const Duration(seconds: 20),
        // )
        ;
    var values = jsonDecode(response!.body);
    var obj = EventModel.fromJson(values);
    if (response.statusCode == 200) {
      // denied.value = false;
      // currentEvents.value = obj.events!;
      upcomingEvents.value = obj.events!;
      // foundshift.value = obj.jobs!;
    } else {
      // AppSnackBar(obj.);
    }
    // } on TimeoutException catch (_) {
    //   stopLoading();
    //   AppSnackBar("Server Problem");
    // } catch (_) {
    //   stopLoading();
    //   print(_);
    //   AppSnackBar("App is not working correct contact Admin");
    // }
    return null;
  }

  // //----------------------------------Apply a Shift Api---------------------------------
  // Future<void> applyShift(context, id) async {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['hospital_id'] = id;
  //   try {
  //     var response =
  //         await ApiService.post(NetworkStrings.applyShiftEndpont, data, true)
  //             .timeout(
  //       const Duration(seconds: 20),
  //     );
  //     var values = jsonDecode(response!.body);
  //     if (response.statusCode == 200) {
  //       SnackBar_Message(values['msg']);

  //       //-------------------Go to Application Receive Alert Box-----------------------
  //       showDialog(
  //           context: context,
  //           builder: (context) => const ApplicationReceivedAlertBox());
  //       Get.back();
  //     } else {
  //       SnackBar_Message(values['msg']);
  //     }
  //   } on TimeoutException catch (_) {
  //     stopLoading();
  //     SnackBar_Message("Server Problem");
  //   } catch (_) {
  //     stopLoading();
  //     SnackBar_Message("App is not working correct contact Admin");
  //   }
  // }

  // //--------GeoLocator For Current Position and Location Permission-----------------------------
  // Future<Position> _getGeoLocationPosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     denied.value = true;

  //     await Geolocator.requestPermission();
  //   }

  //   permission = await Geolocator.requestPermission();

  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       denied.value = true;

  //       permission = await Geolocator.requestPermission();
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     await Geolocator.openAppSettings();
  //     denied.value = true;
  //   }

  //   return await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }
}
