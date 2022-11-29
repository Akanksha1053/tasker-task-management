import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/screen/create_project_bottom_sheet.dart.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_task_bottom_sheet/screen/create_task_bottom.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_team/create_team_screen.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/add_button_widget.dart';

class CreatePopupMenu extends StatelessWidget {
  const CreatePopupMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // constraints: BoxConstraints.expand(width: 199.w, height: 216.h),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
            height: 0,
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).pop();
                createTaskBottomScreen(context);
              },
              child: ListTile(
                  minLeadingWidth: 8,
                  contentPadding: const EdgeInsets.only(left: 8),
                  leading: SvgPicture.asset('lib/assets/images/Task.svg',
                      color: ColorConstants.black, height: 24.r, width: 24.r),
                  title: Text(TextConstants.createTaskText,
                      style: TextStyleConstants.forgotPasswordTextStyle)),
            )),
        PopupMenuItem(
            height: 0,
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).pop();
                createProjectBottomSheet(
                  context: context,
                );
              },
              child: ListTile(
                  minLeadingWidth: 8,
                  contentPadding: const EdgeInsets.only(left: 8),
                  leading: SvgPicture.asset('lib/assets/images/Project.svg',
                      color: ColorConstants.black, height: 24.r, width: 24.r),
                  title: Text(TextConstants.createProjectText,
                      style: TextStyleConstants.forgotPasswordTextStyle)),
            )),
        PopupMenuItem(
            height: 0,
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).pop();
                createTeamBottomScreen(
                  context: context,
                );
              },
              child: ListTile(
                  minLeadingWidth: 8,
                  contentPadding: const EdgeInsets.only(left: 8),
                  leading: SvgPicture.asset('lib/assets/images/member.svg',
                      color: ColorConstants.black, height: 24.r, width: 24.r),
                  title: Text(TextConstants.createTeamText,
                      style: TextStyleConstants.forgotPasswordTextStyle)),
            )),
        PopupMenuItem(
            height: 0,
            child: ListTile(
                minLeadingWidth: 8,
                contentPadding: const EdgeInsets.only(left: 8),
                leading: SvgPicture.asset('lib/assets/images/Meeting.svg',
                    color: ColorConstants.black, height: 24.r, width: 24.r),
                title: Text(TextConstants.createMeetingText,
                    style: TextStyleConstants.forgotPasswordTextStyle))),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: const AddButtonWidget(
        buttonColor: ColorConstants.purple,
        iconColor: ColorConstants.white,
      ),
    );
  }
}
