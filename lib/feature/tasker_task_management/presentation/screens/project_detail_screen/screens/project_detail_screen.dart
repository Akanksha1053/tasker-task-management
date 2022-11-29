import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/project_detail_screen/widget/create_popup.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/project_detail_screen/widget/brainstorm_design_text_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/project_detail_screen/widget/more_icon_popup_menu.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/project_detail_screen/widget/project_detail_taskview_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/circle_avatar_icon_widget.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        extendBody: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(
                color: ColorConstants.black, size: 24.r //change your color here
                ),
            automaticallyImplyLeading: true,
            backgroundColor: ColorConstants.appbarBackgroundColor,
            elevation: 0,
            title: Text(
              'Project detail',
              style: TextStyleConstants.appbarTitleTextStyle,
            ),
            actions: const [
              CreatePopupMenu(),
            ]),
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16),
              color: ColorConstants.scaffoldBackgroundColor,
              child: Column(children: [
                Row(children: [
                  CircleAvatarIconWidget(
                    radius: 50.r,
                    height: 28.r,
                    width: 28.r,
                    assetPath: 'lib/assets/images/dashboard.svg',
                    avatarColor: ColorConstants.lightGrey,
                    iconColor: ColorConstants.black,
                  ),
                  const SizedBox(width: 8),
                  Text(TextConstants.projectName,
                      style: TextStyleConstants.projectNameTextStyle),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: SvgPicture.asset(
                          'lib/assets/images/notification.svg',
                          color: ColorConstants.black,
                          height: 24.r,
                          width: 24.r)),
                  const MoreIconPopupMenuWidget(),
                ]),
                SizedBox(height: 24.h),
                const BrainstormDesignTextWidget(
                  text: TextConstants.brainstormText,
                ),
                SizedBox(height: 24.h),
                const BrainstormDesignTextWidget(
                    text: TextConstants.designText),
                SizedBox(height: 24.h),
                const ProjectDetailTaskViewWidget(),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: ColorConstants.grey,
                          size: 24.r,
                        )),
                    Text(TextConstants.addGroupText,
                        style: TextStyleConstants.alreadyHaveAnAccountTextStyle)
                  ],
                )
              ])),
        ));
  }
}
