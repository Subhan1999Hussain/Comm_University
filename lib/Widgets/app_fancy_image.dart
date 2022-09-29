import 'package:communiversity/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class AppFancyImage extends StatelessWidget {
  String image;
  bool? is_proile;
  AppFancyImage({Key? key, required this.image, this.is_proile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      errorWidget: Image.network(
          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
      imageUrl: image,
      shimmerBaseColor: AppColors.PRIMARY_COLOR,
      shimmerHighlightColor: AppColors.SPLASH_COLOR,
      shimmerBackColor: AppColors.DARK_GREY_COLOR,
      boxFit: is_proile == true ? BoxFit.cover : BoxFit.cover,
    );
  }
}
