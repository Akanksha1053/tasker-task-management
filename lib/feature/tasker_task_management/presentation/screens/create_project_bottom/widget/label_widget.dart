import 'package:flutter/material.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Text(
        text,
        style: TextStyleConstants.headlineTextStyle,
      ),
    );
  }
}
