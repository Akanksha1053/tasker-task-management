import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/add_button_widget.dart';

class ConstantData {
  static List<Widget> memberProfiles = const [
    CircleAvatar(
      backgroundImage: AssetImage('lib/assets/images/profile.jpeg'),
      radius: 32,
    ),
    CircleAvatar(
      backgroundImage: AssetImage(
        'lib/assets/images/profile.jpeg',
      ),
      radius: 32,
    ),
  ];
  static List<Widget> labelData = [
    const LabelColorContainer(color: ColorConstants.grey),
    const LabelColorContainer(color: ColorConstants.lightGrey),
    const LabelColorContainer(color: ColorConstants.darkBlue),
    const LabelColorContainer(color: ColorConstants.orange),
  ];
}

class LabelColorContainer extends StatelessWidget {
  const LabelColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 50,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(12.r)),
    );
  }
}
