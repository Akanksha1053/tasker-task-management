import 'package:flutter/material.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: ColorConstants.grey,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(text, style: TextStyleConstants.orSignUpWithTextStyle),
        const SizedBox(
          width: 5,
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: ColorConstants.grey,
          ),
        )
      ],
    );
  }
}
