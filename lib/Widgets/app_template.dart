import 'package:communiversity/Widgets/custom_app_header.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTemplate extends StatelessWidget {
  String? title;
  String? leading;
  Function()? onclickLead;
  String? actionText;
  String? action;
  Function()? onclickAction;
  Color? color;
  List<String> headimagesList;
  Widget bodyChild;
  Widget? headChild;
  bool? is_search;

  AppTemplate(
      {Key? key,
      this.title,
      this.actionText,
      this.action,
      this.leading,
      this.onclickAction,
      this.onclickLead,
      this.color,
      this.is_search = false,
      this.headChild,
      this.headimagesList = const [],
      required this.bodyChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.LIGHT_GREY_COLOR,
      body: Column(children: [
        CustomAppHeader(
            headimagesList: headimagesList,
            actionText: actionText,
            action: action,
            leading: leading,
            onclickAction: onclickAction,
            onclickLead: onclickLead,
            title: title,
            color: headimagesList.isNotEmpty
                ? AppColors.BLACK_COLOR
                : AppColors.WHITE_COLOR,
            is_search: is_search,
            headChild: headChild),
        Expanded(child: bodyChild),
      ]),
    );
  }
}
