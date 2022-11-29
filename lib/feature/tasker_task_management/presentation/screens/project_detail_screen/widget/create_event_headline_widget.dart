import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class CreateEventBottomPageHeadline extends StatelessWidget {
  const CreateEventBottomPageHeadline({
    Key? key,
    required this.headlineText,
  }) : super(key: key);
  final String headlineText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding:
                const EdgeInsets.only(right: 8.0, top: 8, bottom: 8, left: 115),
            child: Text(headlineText,
                style: TextStyleConstants.appbarTitleTextStyle),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 8.0, top: 8, bottom: 8, left: 32),
          child: IconButton(
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              icon: Icon(
                Icons.close_outlined,
                color: ColorConstants.black,
                size: 24.r,
              )),
        )
      ],
    );
  }
}
