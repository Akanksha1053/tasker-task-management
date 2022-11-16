import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';


class SkipButtonAndTextWidget extends StatelessWidget {
  const SkipButtonAndTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: ColorConstants.purple,
              child: const Icon(
                Icons.forward,
                size: 20,
                color: ColorConstants.white,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              TextConstants.skipText,
              style: TextStyleConstants.skipTextStyle,
            )
          ],
        ),
      ],
    );
  }
}
