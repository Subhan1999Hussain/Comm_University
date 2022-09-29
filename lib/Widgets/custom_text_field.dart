// import 'package:communiversity/utils/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomTextField extends StatelessWidget {
//   String? prefxicon;
//   int? lines;
//   double? prefixIconSize;
//   double? prefixRIghtPadding, sufixRIghtPadding;
//   String? sufixicon;
//   String? error;
//   String? initialValue;
//   final String hint;
//   final double? fontsize, width;
//   final bool? obscureText;
//   TextEditingController? controller;
//   void Function(String?)? onsave;
//   String? Function(String?)? validator;
//   void Function(String)? onchange;

//   final void Function()? onclick;
//   CustomTextField({
//     Key? key,
//     this.prefxicon,
//     this.lines,
//     this.prefixIconSize,
//     this.prefixRIghtPadding,
//     this.sufixRIghtPadding,
//     this.sufixicon,
//     this.error,
//     this.obscureText = false,
//     this.initialValue,
//     required this.hint,
//     this.fontsize,
//     this.width,
//     this.onclick,
//     this.controller,
//     this.onsave,
//     this.validator,
//     this.onchange,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: onchange,
//       initialValue: initialValue,
//       validator: validator,
//       controller: controller,
//       onSaved: onsave,
//       obscureText: obscureText!,
//       minLines: lines??1,
//       maxLines: lines??1,
//       style: TextStyle(fontSize: fontsize ?? 15.sp),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: AppColors.SPLASH_COLOR,

//         // focusColor: AppColors.PRIMARY_COLOR,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(35),
//           borderSide: BorderSide(
//             // width: 0,
//             style: BorderStyle.none,
//           ),
//         ),
//         //     borderSide: BorderSide(
//         //         color: AppColors.PRIMARY_COLOR.withOpacity(0.1))),
//         focusedBorder: OutlineInputBorder(
//              borderRadius: BorderRadius.circular(35),
//           borderSide: BorderSide(
//             // width: 0,
//             style: BorderStyle.none,
//           ),),
//         focusedErrorBorder: OutlineInputBorder(
//              borderRadius: BorderRadius.circular(35),
//           borderSide: BorderSide(
//             // width: 0,
//             style: BorderStyle.none,
//           ),),
//         errorBorder: OutlineInputBorder(
//              borderRadius: BorderRadius.circular(35),
//           borderSide: BorderSide(
//             // width: 0,
//             style: BorderStyle.none,
//           ),),
//         contentPadding: prefxicon == null
//             ? EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h)
//             : EdgeInsets.only(top: 10.h, bottom: 10.h),

//         hintText: prefxicon == null ? hint : null,
//         labelText: prefxicon != null ? hint : null,
//         // label: hint,
//         labelStyle: const TextStyle(color: AppColors.PRIMARY_COLOR),
//         border: InputBorder.none,
//         isDense: true,
//         prefixIcon: prefxicon != null
//             ? Padding(
//                 padding: EdgeInsets.only(
//                     left: 25.w, right: prefixRIghtPadding ?? 25.w),
//                 child:
//                     Image.asset(prefxicon!, width: prefixIconSize ?? 28.0.w))
//             : null,
//         prefixIconConstraints: BoxConstraints(),
//         suffixIcon: sufixicon != null
//             ? GestureDetector(
//                 onTap: onclick,
//                 child: Padding(
//                     padding:
//                         EdgeInsets.only(right: sufixRIghtPadding ?? 25.w,top: 0.03.sh,bottom: 0.03.sh),
//                     child:
//                     Image.asset(
//                       sufixicon!,
//                       width:  0.0.w,
//                       color: AppColors.PRIMARY_COLOR,
//                     )
//                     ),
//               )
//             : SizedBox(height: 0.07.sh),
//       ),
//     );
//   }
// }

import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  String? prefxicon;
  int? lines;
  double? prefixIconSize;
  double? prefixRIghtPadding, sufixRIghtPadding;
  String? sufixicon;
  String? error;
  Color? colorOff;
  String? initialValue;
  final String hint;
  final double? fontsize, width;
  final bool? obscureText;
  TextEditingController? controller;
  void Function(String?)? onsave;
  String? Function(String?)? validator;
  void Function(String)? onchange;

  final void Function()? onclick;
  CustomTextField({
    Key? key,
    this.prefxicon,
    this.lines,
    this.prefixIconSize,
    this.prefixRIghtPadding,
    this.sufixRIghtPadding,
    this.sufixicon,
    this.error,
    this.obscureText = false,
    this.initialValue,
    required this.hint,
    this.fontsize,
    this.colorOff,
    this.width,
    this.onclick,
    this.controller,
    this.onsave,
    this.validator,
    this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 1.sw,
          height: 55.h,
          decoration: BoxDecoration(
              color: AppColors.SPLASH_COLOR,
              borderRadius: BorderRadius.circular(35)),
        ),
        TextFormField(
          onChanged: onchange,
          initialValue: initialValue,
          validator: validator,
          controller: controller,
          onSaved: onsave,
          obscureText: obscureText!,
          minLines: lines ?? 1,
          maxLines: lines ?? 1,
          style: TextStyle(fontSize: fontsize ?? 15.sp),
          
          decoration: InputDecoration(
            // filled: true,
            // fillColor: Color.fromARGB(255, 33, 22, 185).withOpacity(0.1),

            focusColor: AppColors.PRIMARY_COLOR,
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(35),
            //   borderSide: BorderSide(
            //     // width: 0,
            //     style: BorderStyle.none,
            //   ),
            // ),
            // //     borderSide: BorderSide(
            // //         color: AppColors.PRIMARY_COLOR.withOpacity(0.1))),
            // focusedBorder: OutlineInputBorder(
            //      borderRadius: BorderRadius.circular(35),
            //   borderSide: BorderSide(
            //     // width: 0,
            //     style: BorderStyle.none,
            //   ),),
            // focusedErrorBorder: OutlineInputBorder(
            //      borderRadius: BorderRadius.circular(35),
            //   borderSide: BorderSide(
            //     // width: 0,
            //     style: BorderStyle.none,
            //   ),),
            // errorBorder: OutlineInputBorder(
            //      borderRadius: BorderRadius.circular(35),
            //   borderSide: BorderSide(
            //     // width: 0,
            //     style: BorderStyle.none,
            //   ),),
            contentPadding: prefxicon == null
                ? EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h)
                : EdgeInsets.only(top: 10.h, bottom: 10.h,left: 25.w),

            hintText: prefxicon == null ? hint : null,
            labelText: prefxicon != null ? hint : null,
            // label: hint,
            //99999999999999999999999999999999999999999999999999999999999999
            //99999999999999999999999999999999999999999999999999999999999999
            //99999999999999999999999999999999999999999999999999999999999999
            labelStyle:  TextStyle(color:colorOff),
            // errorStyle:TextStyle(decoration: ) ,
            border: InputBorder.none,
            isDense: true,
            prefixIcon: prefxicon != null
                ? Padding(
                    padding: EdgeInsets.only(
                        left: 25.w, right: prefixRIghtPadding ?? 25.w),
                         //99999999999999999999999999999999999999999999999999999999999999
            //99999999999999999999999999999999999999999999999999999999999999
            //99999999999999999999999999999999999999999999999999999999999999
                    child: Image.asset(prefxicon!,color:colorOff,
                        width: prefixIconSize ?? 28.0.w))
                : null,
            prefixIconConstraints: BoxConstraints(),
            suffixIcon: sufixicon != null
                ? GestureDetector(
                    onTap: onclick,
                    child: Padding(
                        padding:
                            EdgeInsets.only(right: sufixRIghtPadding ?? 25.w),
                        child: Image.asset(
                          sufixicon!,
                          width: 0.0.w,
                          color: colorOff,
                        )),
                  )
                : SizedBox(height: 0.07.sh),
          ),
        ),
      ],
    );
  }
}
