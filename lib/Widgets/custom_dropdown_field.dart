// import 'package:communiversity/Widgets/custom_text.dart';
// import 'package:communiversity/utils/app_color.dart';
// import 'package:communiversity/utils/assets_path.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomDropdownField extends StatelessWidget {
//   List? Itemsss;
//   String? value;
//   Function(String?)? onchange;
//   CustomDropdownField({Key? key, this.Itemsss, this.onchange, this.value})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color:AppColors.SPLASH_COLOR,
//       borderRadius: BorderRadius.circular(35) ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButtonFormField<String>(

//           // hint: CustomText(
//           //     maintext: "Position Applied for", color: AppColors.GREY_COLOR),
//           value: value,
//           isExpanded: true,
//           icon: const Padding(
//             padding: EdgeInsets.only(right:28.0),
//             child: Icon(Icons.keyboard_arrow_down),
//           ),
//           elevation: 16,
//           style: TextStyle(color: AppColors.BLACK_COLOR, fontSize: 20.sp),
//           onChanged: onchange,
//           // validator: (value) => value == null ? "Please Select Position" : null,
//           decoration: InputDecoration(
//             prefixIcon:
//                Padding(
//                   padding: EdgeInsets.only(
//                       left: 25.w, right: 10.w),
//                   child:
//                       Image.asset(AssetPaths.GRADUATE_ICON, width:  28.0.w)),
//           prefixIconConstraints: BoxConstraints(),
//                       border: InputBorder.none,

//             label: CustomText(
//               maintext: "Position Applied for", color: AppColors.PRIMARY_COLOR,fontsize: 15.sp),
//             // filled: true,
//             // fillColor: const Color.fromARGB(255, 230, 225, 240).withOpacity(0.1),
//             // contentPadding: EdgeInsets.only(left: 25.w, right: 25.w),
//           //   enabledBorder: OutlineInputBorder(
//           //       borderRadius: BorderRadius.circular(35),
//           //       borderSide:
//           //           BorderSide(color: AppColors.PRIMARY_COLOR.withOpacity(0.1))),
//           //   focusedBorder: OutlineInputBorder(
//           //       borderRadius: BorderRadius.circular(35),
//           //       borderSide:
//           //           BorderSide(color: AppColors.PRIMARY_COLOR.withOpacity(0.4))),
//           //   focusedErrorBorder: OutlineInputBorder(
//           //       borderRadius: BorderRadius.circular(35),
//           //       borderSide:
//           //           BorderSide(color: AppColors.PRIMARY_COLOR.withOpacity(0.4))),
//           //   errorBorder: OutlineInputBorder(
//           //       borderRadius: BorderRadius.circular(35),
//           //       borderSide:
//           //           BorderSide(color: AppColors.RED_COLOR.withOpacity(0.4))),
//           ),
//           items: Itemsss!.map<DropdownMenuItem<String>>((dynamic item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               child: Text(
//                 item,
//                 style: TextStyle(fontSize: 15.sp),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField extends StatelessWidget {
  List? Itemsss;
  String? value;
  Color? colorOff;
  Function(String?)? onchange;
  CustomDropdownField({Key? key, this.Itemsss,this.colorOff, this.onchange, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(
        width: 1.sw,
          height: 55.h,
      decoration: BoxDecoration(
          color: AppColors.SPLASH_COLOR,
          borderRadius: BorderRadius.circular(35)),
    
    ),DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          // hint: CustomText(
          //     maintext: "Position Applied for", color: AppColors.GREY_COLOR),
          value: value,
          isExpanded: true,
          icon: const Padding(
            padding: EdgeInsets.only(right: 28.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
          elevation: 16,
          style: TextStyle(color: AppColors.BLACK_COLOR, fontSize: 20.sp),
          onChanged: onchange,
          validator: (value) => value == null ? "Please Select Program" : null,
          decoration: InputDecoration(
            focusColor: AppColors.PRIMARY_COLOR,
            prefixIcon: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 10.w),
                child: Image.asset(AssetPaths.GRADUATE_ICON, width: 28.0.w,color:colorOff,)),
            prefixIconConstraints: BoxConstraints(),
            border: InputBorder.none,

            label: CustomText(
                maintext: "Choose Program",
                color:colorOff,
                fontsize: 15.sp),
            // filled: true,
            // fillColor: const Color.fromARGB(255, 230, 225, 240).withOpacity(0.1),
            contentPadding:  EdgeInsets.only(top: 10.h, bottom: 10.h,left: 25.w),
            //   enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(35),
            //       borderSide:
            //           BorderSide(color: AppColors.PRIMARY_COLOR.withOpacity(0.1))),
            //   focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(35),
            //       borderSide:
            //           BorderSide(color: AppColors.PRIMARY_COLOR.withOpacity(0.4))),
            //   focusedErrorBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(35),
            //       borderSide:
            //           BorderSide(color: AppColors.PRIMARY_COLOR.withOpacity(0.4))),
            //   errorBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(35),
            //       borderSide:
            //           BorderSide(color: AppColors.RED_COLOR.withOpacity(0.4))),
          ),
          items: Itemsss!.map<DropdownMenuItem<String>>((dynamic item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 15.sp),
              ),
            );
          }).toList(),
        ),
      ),],
    );

    
  }
}
