import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class ChoosePlanWidget extends StatelessWidget {
  const ChoosePlanWidget({
    Key? key,
    required this.emoji,
    required this.planTypeText,
    required this.planDetailText,
    required this.planTypeTextStyle,
  }) : super(key: key);

  final String emoji;
  final String planTypeText;
  final String planDetailText;
  final TextStyle planTypeTextStyle;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        emoji,
        style: TextStyle(fontSize: 30.sp),
      ),
      SizedBox(
        height: 16.h,
      ),
      Text(
        planTypeText,
        style: planTypeTextStyle,
      ),
      SizedBox(
        height: 16.h,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Text(
          planDetailText,
          style: TextStyleConstants.alreadyHaveAnAccountTextStyle,
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }
}
