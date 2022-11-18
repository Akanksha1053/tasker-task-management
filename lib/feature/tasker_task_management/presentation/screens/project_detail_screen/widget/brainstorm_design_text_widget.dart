import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class BrainstormDesignTextWidget extends StatelessWidget {
  const BrainstormDesignTextWidget({Key? key, required this.text})
      : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyleConstants.headlineTextStyle),
        SvgPicture.asset(
          'lib/assets/images/Drop down.svg',
          color: ColorConstants.black,
        )
      ],
    );
  }
}