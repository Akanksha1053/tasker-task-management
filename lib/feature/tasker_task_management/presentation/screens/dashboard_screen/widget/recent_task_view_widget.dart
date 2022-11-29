import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/circle_avatar_icon_widget.dart';

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
            leading: CircleAvatarIconWidget(
              radius: 50.r,
              assetPath: 'lib/assets/images/dashboard.svg',
              height: 44.r,
              width: 44.r,
              avatarColor: ColorConstants.lightGrey,
              iconColor: ColorConstants.black,
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
