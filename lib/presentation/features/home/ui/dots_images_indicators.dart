import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:spacex_app/presentation/common/colors/app_colors.dart';

class DotsImagesIndicator extends StatelessWidget {
  const DotsImagesIndicator({
    super.key,
    required List rocketsImg,
    required ValueNotifier<int> initialIndex,
  })  : _rocketsImg = rocketsImg,
        _initialIndex = initialIndex;

  final List _rocketsImg;
  final ValueNotifier<int> _initialIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: _rocketsImg.length,
      position: _initialIndex.value,
      decorator: const DotsDecorator(
        color: Colors.transparent,
        size: Size.square(10),
        activeColor: AppColors.elemetsColor,
        shape: CircleBorder(
          side: BorderSide(color: AppColors.elemetsColor),
        ),
        spacing: EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }
}
