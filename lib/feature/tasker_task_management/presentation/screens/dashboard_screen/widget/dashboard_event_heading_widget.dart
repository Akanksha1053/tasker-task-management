import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class DashboardEventHeadingWidget extends StatelessWidget {
  const DashboardEventHeadingWidget(
      {Key? key, required this.assetPath, required this.headlineText})
      : super(key: key);
  final String assetPath;
  final String headlineText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  assetPath,
                  color: ColorConstants.orange,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(headlineText, style: TextStyleConstants.headlineTextStyle),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(const ProjectDetailScreenRoute());
              },
              child: SvgPicture.asset(
                'lib/assets/images/forward.svg',
                color: ColorConstants.purple,
              ),
            )
          ],
        )
      ],
    );
  }
}
