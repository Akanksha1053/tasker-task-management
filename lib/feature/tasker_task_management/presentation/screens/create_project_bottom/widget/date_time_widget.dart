import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/calendar_view_widget.dart';

class DateAndTimeWidget extends StatefulWidget {
  DateAndTimeWidget({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.setStartDate,
    required this.setEndDate,
  }) : super(key: key);

  String startDate;
  String endDate;
  final ValueChanged setStartDate;
  final ValueChanged setEndDate;

  @override
  State<DateAndTimeWidget> createState() => _DateAndTimeWidgetState();
}

class _DateAndTimeWidgetState extends State<DateAndTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CalendarViewWidget(
              avatarColor: ColorConstants.darkBlue,
              iconColor: ColorConstants.white,
              selectedDate: widget.startDate,
              pickDate: (String value) {
                setState(() {
                  widget.startDate = value;
                });

                widget.setStartDate(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(widget.startDate),
            )
          ],
        ),
        Row(
          children: [
            CalendarViewWidget(
              avatarColor: ColorConstants.purple,
              iconColor: ColorConstants.white,
              selectedDate: widget.endDate,
              pickDate: (String value) {
                setState(() {
                  widget.endDate = value;
                });

                widget.setEndDate(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(widget.endDate),
            )
          ],
        )
      ],
    );
  }
}
