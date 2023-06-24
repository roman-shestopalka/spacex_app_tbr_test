import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacex_app/presentation/common/colors/app_colors.dart';

class ImagesCarousel extends StatelessWidget {
  const ImagesCarousel({
    super.key,
    required CarouselController controller,
    required List rocketsImg,
    required ValueNotifier<int> initialIndex,
  })  : _controller = controller,
        _rocketsImg = rocketsImg,
        _initialIndex = initialIndex;

  final CarouselController _controller;
  final List _rocketsImg;
  final ValueNotifier<int> _initialIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Expanded(
        child: CarouselSlider.builder(
          carouselController: _controller,
          itemCount: _rocketsImg.length,
          itemBuilder: ((context, index, realIndex) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.captionColor,
              ),
              child: Image(
                image: AssetImage(_rocketsImg[index]),
                fit: BoxFit.cover,
              ),
            );
          }),
          options: CarouselOptions(
            initialPage: _initialIndex.value,
            onPageChanged: (index, reason) => _initialIndex.value = index,
            height: 200,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            viewportFraction: 0.78,
          ),
        ),
      ),
    );
  }
}
