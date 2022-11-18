import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectDate extends StatelessWidget {
  const ProjectDate({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24.h,
          child:
              SvgPicture.asset('lib/assets/images/calendar.svg', color: color),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          '01/01/22',
          style: TextStyle(color: color),
        )
      ],
    );
  }
}
