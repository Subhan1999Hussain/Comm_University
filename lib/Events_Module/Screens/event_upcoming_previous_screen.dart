import 'package:communiversity/Events_Module/Custom_Widget/custom_checkbox.dart';
import 'package:communiversity/Events_Module/Custom_Widget/custom_tab.dart';
import 'package:communiversity/Events_Module/Custom_Widget/custom_event_container.dart';
import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_color.dart';
import 'package:communiversity/utils/app_padding.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:flutter/material.dart';

class EventUpcomingPreviousScreen extends StatefulWidget {
  const EventUpcomingPreviousScreen({Key? key}) : super(key: key);

  @override
  State<EventUpcomingPreviousScreen> createState() =>
      _EventUpcomingPreviousScreenState();
}

class _EventUpcomingPreviousScreenState
    extends State<EventUpcomingPreviousScreen> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return
        // Text("dfhruetyuretyueytut");
        Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: screeen_padding.screenPadding),
      child: CustomTab(
        firstTXT: AppStrings.UPCOMING_EVENTS_BUTTON_TEXT,
        secondTXT: AppStrings.PREVIOUS_EVENTS_BUTTON_TEXT,
        firstWidget: fav(),
        secondWidget: fav(),
      ),
    );
  }

  Widget fav() {
    return Column(
      children: [
        // Text("ettttttttttttttttttttttttttttttt"),
        // Row(
        //   children: [
        CustomCheckBox(
          is_checked: checked,
          onclick: (bool? value) {
            setState(() {
              checked = value!;
            });
          },
        ),

        //   ],
        // ),
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: CustomEventContainer(
                    eventName: "uuuuuuuuuu",
                    date: "02 Sep",
                    image: [
                      "uploads/eventPictures/2022-09-27T07-31-56.623Z1498199 (2).jpg"
                    ],
                    location: "ytyttttt",
                    time: "13:45 AM",
                    details: "frkdf",
                    onTap: () {},
                  ),
                );
              }),
        ),
      ],
    );
  }
}
