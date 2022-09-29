import 'package:communiversity/Utils/app_strings.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  void Function(bool?)? onclick;
  bool? is_checked;
  CustomCheckBox({Key? key, required this.is_checked,this.onclick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      activeColor: AppColors.WHITE_COLOR,
      checkColor: AppColors.BLACK_COLOR,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      value: is_checked,
      onChanged: onclick, 
      
      title: CustomText(maintext: AppStrings.VIEW_ONLY_FAVORITES_TEXT),
      secondary: const Icon(
        Icons.filter_alt_rounded,
        color: AppColors.PRIMARY_COLOR,
        size: 40.0,
      ),
    );
  }
}
