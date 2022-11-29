import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/circle_avatar_icon_widget.dart';
import 'package:intl/intl.dart';

class CalendarViewWidget extends StatelessWidget {
  CalendarViewWidget({
    Key? key,
    required this.avatarColor,
    required this.iconColor,
    required this.selectedDate,
    required this.pickDate,
  }) : super(key: key);
  final Color avatarColor;
  final Color iconColor;
  final Function(String) pickDate;
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: InkWell(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2015, 8),
              lastDate: DateTime(2101));
          if (picked != null &&
              DateFormat.yMd().format(picked) != selectedDate) {
            String newDate = DateFormat.yMd().format(picked);
            pickDate(newDate);
          }
        },
        child: CircleAvatarIconWidget(
          radius: 50.r,
          assetPath: 'lib/assets/images/calendar.svg',
          width: 48,
          height: 48,
          avatarColor: avatarColor,
          iconColor: iconColor,
        ),
      ),
    );
  }
}
