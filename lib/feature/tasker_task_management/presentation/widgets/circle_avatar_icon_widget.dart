import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleAvatarIconWidget extends StatelessWidget {
  const CircleAvatarIconWidget(
      {Key? key,
      required this.radius,
      required this.assetPath,
      required this.height,
      required this.width,
      required this.iconColor,
      required this.avatarColor})
      : super(key: key);
  final double radius;
  final String assetPath;
  final double height;
  final double width;
  final Color iconColor;
  final Color avatarColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: avatarColor, borderRadius: BorderRadius.circular(radius)),
      child: SvgPicture.asset(
        assetPath,
        color: iconColor,
        height: 24.r,
        width: 24.r,
        fit: BoxFit.contain,
      ),
    );
  }
}
