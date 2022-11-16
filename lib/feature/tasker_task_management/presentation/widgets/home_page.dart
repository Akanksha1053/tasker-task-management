import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/dashboard_screen_widget/dashboard_event_heading_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/dashboard_screen_widget/project_date.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/dashboard_screen_widget/project_overview_card.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/dashboard_screen_widget/dashboard_search_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/dashboard_screen_widget/tab_view_buttons.dart';

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
              height: 32.h,
            ),
            const TabViewButton(),
            SizedBox(
              height: 32.h,
            ),
            const DashboardEventHeadingWidget(
                assetPath: 'lib/assets/images/Project.svg',
                headlineText: TextConstants.yourProjectText),
            SizedBox(
              height: 32.h,
            ),
            const ProjectOverviewCard(),
            SizedBox(
              height: 32.h,
            ),
            const DashboardEventHeadingWidget(
                assetPath: 'lib/assets/images/Task.svg',
                headlineText: TextConstants.yourRecentTaskText),
            // SizedBox(
            //   height: 32.h,
            // ),
            Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: ColorConstants.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ListView.builder(
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 112.h,
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: ColorConstants.white,
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstants.lightGrey, blurRadius: 10.r)
                        ],
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 32.h,
                                width: 32.h,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: ColorConstants.grey,
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: SvgPicture.asset(
                                  'lib/assets/images/dashboard.svg',
                                  color: ColorConstants.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  TextConstants.taskNameText,
                                  style:
                                      TextStyleConstants.projectNameTextStyle,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 8),
                                height: 32.h,
                                child: SvgPicture.asset(
                                  'lib/assets/images/calendar.svg',
                                  color: ColorConstants.grey,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 8.0),
                                child: Text(
                                  'Deadline:',
                                  style: TextStyleConstants.bodyTextStyle,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 8.0),
                                child: Text(
                                  '03/01/2021',
                                  style: TextStyleConstants.bodyTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
