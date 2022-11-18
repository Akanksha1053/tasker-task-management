import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/widget/dashboard_event_heading_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/widget/dashboard_search_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/widget/project_overview_card.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/widget/recent_task_view_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/dashboard_screen/widget/tab_view_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 375.w,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DashboardSearchWidget(),
            SizedBox(
              height: 16.h,
            ),
            const TabViewButton(),
            SizedBox(
              height: 16.h,
            ),
            const DashboardEventHeadingWidget(
                assetPath: 'lib/assets/images/Project.svg',
                headlineText: TextConstants.yourProjectText),
            SizedBox(
              height: 16.h,
            ),
            const ProjectOverviewCard(),
            SizedBox(
              height: 16.h,
            ),
            const DashboardEventHeadingWidget(
                assetPath: 'lib/assets/images/Task.svg',
                headlineText: TextConstants.yourRecentTaskText),
            SizedBox(
              height: 16.h,
            ),
            const TaskViewWidget(),
            const TaskViewWidget(),
            const TaskViewWidget(),
            const TaskViewWidget()
          ],
        ),
      ),
    );
  }
}
