import 'package:communiversity/utils/assets_path.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Image.asset(AssetPaths.MAP_IMAGE),
        ],
      ),
    );
  }
}
