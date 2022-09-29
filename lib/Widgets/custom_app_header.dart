import 'package:communiversity/Widgets/custom_app_bar.dart';
import 'package:communiversity/Widgets/custom_text_field.dart';
import 'package:communiversity/utils/Services/network_strings.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/scroll_page.dart';

class CustomAppHeader extends StatelessWidget {
  String? title;
  String? leading;
  Function()? onclickLead;
  String? actionText;
  String? action;
  Function()? onclickAction;
  bool? is_search;
  Color? color;
  List<String> headimagesList;
  Widget? headChild;
  CustomAppHeader(
      {Key? key,
      this.title,
      this.actionText,
      this.action,
      this.leading,
      this.onclickAction,
      this.onclickLead,
      this.is_search = false,
      this.headimagesList = const [],
      this.color,
      this.headChild})
      : super(key: key);
  // static const _images = [
  //   // AssetPaths.BACKGROUND_FORGOT_IMAGE,
  //   // AssetPaths.BACKGROUND_RESET_IMAGE,
  //   // AssetPaths.BACKGROUND_OTP_IMAGE,
  //   AssetPaths.BACKGROUND_LOGIN_IMAGE,
  //   AssetPaths.EVENT_IMAGE
  // ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // headImagePath != null
        headimagesList.isNotEmpty
            ? SizedBox(
                height: 0.4.sh,
                child: ScrollPageView(
                  // scrollDirection: Axis.vertical,
                  physics: headimagesList.length == 1
                      ? NeverScrollableScrollPhysics()
                      : null,
                  indicatorColor: AppColors.DARK_GREY_COLOR,
                  checkedIndicatorColor: AppColors.PRIMARY_COLOR,
                  controller: ScrollPageController(),
                  children:
                      headimagesList.map((image) => _imageView(image)).toList(),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 0.17.sh,
                    minWidth: 1.sw,
                    maxWidth: 1.sw,
                  ),
                  child: DecoratedBox(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: AppColors.PRIMARY_COLOR),
                      child: Padding(
                          padding: const EdgeInsets.only(
                            top: 90,
                            bottom: 20,
                          ),
                          child: headChild)),
                ),
              ),
        CustomAppBar(
          title: title,
          actionText: actionText,
          action: action,
          leading: leading,
          onclickAction: onclickAction,
          onclickLead: onclickLead,
          color: color,
        ),
        // headImagePath == null
        // headimagesList.isNotEmpty
        is_search == true
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 110, bottom: 15.0),
                child: CustomTextField(
                  hint: "Search",
                  sufixicon: AssetPaths.SEARCH_ICON,
                ),
              )
            : Container()
      ],
    );
  }

  Widget _imageView(String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
        image: DecorationImage(image: NetworkImage(NetworkStrings.baseUrl+image), fit: BoxFit.fill),
      ),
    );
  }
}
