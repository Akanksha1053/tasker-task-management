import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_management/core/constants/color_constants.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: const ExpandingDotsEffect(
        spacing: 8.0,
        radius: 10.0,
        dotWidth: 10.0,
        dotHeight: 10.0,
        strokeWidth: 0.5,
        dotColor: ColorConstants.grey,
        activeDotColor: ColorConstants.purple,
        paintStyle: PaintingStyle.fill,
      ),
    );
  }
}
