import 'package:flutter/material.dart';
import 'package:entry/entry.dart';

class AppAnimation extends StatelessWidget {
  Widget child;
  AppAnimation({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Entry.scale(
        visible: true, duration: const Duration(seconds: 1), child: child);
  }
}
