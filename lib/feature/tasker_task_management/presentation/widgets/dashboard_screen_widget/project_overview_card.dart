import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/dashboard_screen_widget/project_date.dart';

class ProjectOverviewCard extends StatelessWidget {
  const ProjectOverviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148.h,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(color: ColorConstants.lightGrey, blurRadius: 10.r)
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TextConstants.projectName,
                style: TextStyleConstants.projectNameTextStyle),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ProjectDate(color: ColorConstants.grey),
            ProjectDate(color: ColorConstants.purple),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            const Text('50%'),
            SizedBox(
              width: 8.w,
            ),
            LinearPercentIndicator(
              width: 200.w,
              lineHeight: 8.h,
              barRadius: Radius.circular(16.r),
              percent: 0.5,
              backgroundColor: ColorConstants.lightGrey,
              progressColor: ColorConstants.purple,
            ),
            const Text('24/48 tasks'),
          ],
        )
      ]),
    );
  }
}
