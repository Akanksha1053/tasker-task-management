import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';

class MoreIconPopupMenuWidget extends StatelessWidget {
  const MoreIconPopupMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                  child: ListTile(
                      leading: SvgPicture.asset(
                          'lib/assets/images/check done.svg',
                          color: ColorConstants.black,
                          height: 24.r,
                          width: 24.r),
                      title: Text(TextConstants.checkDoneText,
                          style: TextStyleConstants.forgotPasswordTextStyle))),
              PopupMenuItem(
                  child: ListTile(
                      leading: SvgPicture.asset('lib/assets/images/copy.svg',
                          color: ColorConstants.black,
                          height: 24.r,
                          width: 24.r),
                      title: Text(TextConstants.copyLineText,
                          style: TextStyleConstants.forgotPasswordTextStyle))),
              PopupMenuItem(
                  child: ListTile(
                      leading: SvgPicture.asset('lib/assets/images/share.svg',
                          color: ColorConstants.black,
                          height: 24.r,
                          width: 24.r),
                      title: Text(TextConstants.shareText,
                          style: TextStyleConstants.forgotPasswordTextStyle))),
              PopupMenuItem(
                  child: ListTile(
                      leading: SvgPicture.asset('lib/assets/images/delete.svg',
                          color: ColorConstants.red, height: 24.r, width: 24.r),
                      title: Text(TextConstants.deleteProjectText,
                          style: TextStyleConstants.deleteProjectTextStyle))),
            ],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: SvgPicture.asset('lib/assets/images/more.svg',
            color: ColorConstants.black, height: 24.r, width: 24.r));
  }
}
