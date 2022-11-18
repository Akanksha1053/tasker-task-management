import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

// class RecentTaskView extends StatelessWidget {
//   const RecentTaskView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: MediaQuery.of(context).size.height / 3,
//         decoration: BoxDecoration(
//           color: ColorConstants.scaffoldBackgroundColor,
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         child: ListView.builder(
//           itemCount: 4,
//           itemBuilder: (BuildContext context, int index) {
//             return TaskViewWidget();
//           },
//         ));
//   }
// }

class TaskViewWidget extends StatelessWidget {
  const TaskViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 112.h,
        margin: EdgeInsets.only(bottom: 16.h),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: ColorConstants.white,
          boxShadow: [
            BoxShadow(color: ColorConstants.lightGrey, blurRadius: 10.r)
          ],
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ListTile(
            leading: CircleAvatarDashboardWidget(
              radius: 50.r,
            ),
            title: Text(
              TextConstants.taskNameText,
              style: TextStyleConstants.projectNameTextStyle,
            ),
            subtitle: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  height: 28.h,
                  child: SvgPicture.asset(
                    'lib/assets/images/calendar.svg',
                    color: ColorConstants.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 4.0),
                  child: Text(
                    'Deadline:',
                    style: TextStyleConstants.bodyTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8.0),
                  child: Text(
                    '03/01/2021',
                    style: TextStyleConstants.bodyTextStyle,
                  ),
                ),
              ],
            )));
  }
}

class CircleAvatarDashboardWidget extends StatelessWidget {
  const CircleAvatarDashboardWidget({Key? key, required this.radius})
      : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.r,
      width: 28.r,
      decoration: BoxDecoration(
          color: ColorConstants.lightGrey,
          borderRadius: BorderRadius.circular(radius)),
      child: SvgPicture.asset(
        'lib/assets/images/dashboard.svg',
        color: ColorConstants.black,
      ),
    );
  }
}
