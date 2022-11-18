import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class TabViewButton extends StatefulWidget {
  const TabViewButton({super.key});

  @override
  State<TabViewButton> createState() => _TabViewButtonState();
}

class _TabViewButtonState extends State<TabViewButton> {
  bool selectedPageOverviewButton = true;
  bool selectedPageAnalyticsButton = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                if (selectedPageAnalyticsButton &&
                    !selectedPageOverviewButton) {
                  selectedPageAnalyticsButton = !selectedPageAnalyticsButton;
                  selectedPageOverviewButton = !selectedPageOverviewButton;
                }
              });
            },
            style: selectedPageOverviewButton
                ? TextStyleConstants.getStartedButtonStyle
                : const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ColorConstants.white),
                    foregroundColor:
                        MaterialStatePropertyAll(ColorConstants.grey)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
              child: Text(
                TextConstants.overviewText,
              ),
            )),
        SizedBox(
          width: 8.w,
        ),
        TextButton(
            onPressed: () {
              setState(() {
                if (selectedPageOverviewButton &&
                    !selectedPageAnalyticsButton) {
                  selectedPageOverviewButton = !selectedPageOverviewButton;
                  selectedPageAnalyticsButton = !selectedPageAnalyticsButton;
                }
              });
            },
            style: selectedPageAnalyticsButton
                ? TextStyleConstants.getStartedButtonStyle
                : const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ColorConstants.white),
                    foregroundColor:
                        MaterialStatePropertyAll(ColorConstants.grey)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                TextConstants.analyticsText,
              ),
            )),
      ],
    );
  }
}
