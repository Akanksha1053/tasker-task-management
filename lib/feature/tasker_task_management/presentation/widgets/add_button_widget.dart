import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.iconColor,
  }) : super(key: key);
  final Color buttonColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
      height: 44,
      width: 50,
      decoration: BoxDecoration(
        color: ColorConstants.purple,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        Icons.add,
        size: 24.r,
        color: ColorConstants.white,
      ),
    );
  }
}
