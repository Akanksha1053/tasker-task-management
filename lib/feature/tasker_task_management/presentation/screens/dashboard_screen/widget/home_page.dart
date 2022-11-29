import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
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
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DashboardSearchWidget(
              leadingIcon: Icons.search,
              label: 'Search',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'lib/assets/images/filter.svg',
                  color: ColorConstants.grey,
                ),
              ),
              controller: searchController,
            ),
            const SizedBox(
              height: 16,
            ),
            const TabViewButton(),
            const SizedBox(
              height: 16,
            ),
            const DashboardEventHeadingWidget(
                assetPath: 'lib/assets/images/Project.svg',
                headlineText: TextConstants.yourProjectText),
            const SizedBox(
              height: 16,
            ),
            const ProjectOverviewCard(),
            const SizedBox(
              height: 16,
            ),
            const DashboardEventHeadingWidget(
                assetPath: 'lib/assets/images/Task.svg',
                headlineText: TextConstants.yourRecentTaskText),
            const SizedBox(
              height: 16,
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
