import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/widget/project_date.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/circle_avatar_icon_widget.dart';

class ProjectDetailTaskViewWidget extends StatelessWidget {
  const ProjectDetailTaskViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 112.h,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorConstants.white,
                boxShadow: [
                  BoxShadow(color: ColorConstants.lightGrey, blurRadius: 10.r)
                ],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatarIconWidget(
                        radius: 8.r,
                        assetPath: 'lib/assets/images/dashboard.svg',
                        height: 28.h,
                        width: 28.w,
                        avatarColor: ColorConstants.lightGrey,
                        iconColor: ColorConstants.black,
                      ),
                      const SizedBox(width: 8),
                      Text('Userflow',
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
                ],
              ),
            );
          }),
    );
  }
}
