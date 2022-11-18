import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';

class LoginOptionWidget extends StatelessWidget {
  const LoginOptionWidget({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorConstants.lightGrey,
      ),
      child: IconButton(
        onPressed: null,
        icon: Icon(icon, color: ColorConstants.black),
        iconSize: 30,
      ),
    );
  }
}
