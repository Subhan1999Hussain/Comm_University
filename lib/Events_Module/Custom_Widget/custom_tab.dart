import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTab extends StatefulWidget {
  final String firstTXT, secondTXT;
  final Widget firstWidget, secondWidget;

  const CustomTab(
      {Key? key,
      required this.firstTXT,
      required this.secondTXT,
      required this.firstWidget,
      required this.secondWidget})
      : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        // margin: EdgeInsets.only(top: 8.0.h),
        height: 47.h,
        decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(50.0),
            // border: Border.all(width: 4.sp, color: AppColors.WHITE_COLOR),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: const Offset(0, 3),
                  color: Color.fromARGB(255, 194, 193, 193).withOpacity(0.2))
            ]),
        child: TabBar(
            controller: tabController,
            indicatorColor: AppColors.PRIMARY_COLOR,
            indicatorWeight: 5.0,
            labelColor: AppColors.PRIMARY_COLOR,
            // indicatorSize: ,
            
            indicatorPadding: EdgeInsets.symmetric(horizontal: 50),
            // labelPadding: EdgeInsets.only(top: 10.0),
            unselectedLabelColor: Colors.grey,
            // indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50.0),
            //   gradient: const LinearGradient(colors: [
            //     AppColors.RED_COLOR,
            //     AppColors.BLACK_COLOR
            //   ]),
            // ),
            
            // labelColor: AppColors.PRIMARY_COLOR,
            // unselectedLabelColor: AppColors.GREY_COLOR,
            tabs: [
              Tab(
                child: 
                CustomText(
                    maintext: widget.firstTXT,
                    fontsize: 15.sp,
                    is_alignLeft: false,
                    fontWeight: FontWeight.bold),
              ),
              Tab(
                child: CustomText(
                    maintext: widget.secondTXT,
                    fontsize: 15.sp,
                    is_alignLeft: false,
                    fontWeight: FontWeight.bold,
                    ),
              ),
            ]),
      ),
      Expanded(
        child: TabBarView(
            controller: tabController,
            children: [widget.firstWidget, widget.secondWidget]),
      ),
    ]);
  }
}
