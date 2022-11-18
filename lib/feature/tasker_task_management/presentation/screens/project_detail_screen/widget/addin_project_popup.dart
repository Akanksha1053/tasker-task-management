import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/constant_data.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/credentials_field_widget.dart';

class AddInProjectPopupMenu extends StatelessWidget {
  const AddInProjectPopupMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: BoxConstraints.expand(width: 199.w, height: 216.h),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
            height: 0,
            child: ListTile(
                minLeadingWidth: 8,
                contentPadding: const EdgeInsets.only(left: 8),
                leading: SvgPicture.asset('lib/assets/images/Task.svg',
                    color: ColorConstants.black, height: 24.r, width: 24.r),
                title: Text(TextConstants.createTaskText,
                    style: TextStyleConstants.forgotPasswordTextStyle))),
        PopupMenuItem(
            height: 0,
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).pop();
                showBottomSheetCreateEvent(context);
              },
              child: ListTile(
                  minLeadingWidth: 8,
                  contentPadding: const EdgeInsets.only(left: 8),
                  leading: SvgPicture.asset('lib/assets/images/Project.svg',
                      color: ColorConstants.black, height: 24.r, width: 24.r),
                  title: Text(TextConstants.createProjectText,
                      style: TextStyleConstants.forgotPasswordTextStyle)),
            )),
        PopupMenuItem(
            height: 0,
            child: ListTile(
                minLeadingWidth: 8,
                contentPadding: const EdgeInsets.only(left: 8),
                leading: SvgPicture.asset('lib/assets/images/member.svg',
                    color: ColorConstants.black, height: 24.r, width: 24.r),
                title: Text(TextConstants.createTeamText,
                    style: TextStyleConstants.forgotPasswordTextStyle))),
        PopupMenuItem(
            height: 0,
            child: ListTile(
                minLeadingWidth: 8,
                contentPadding: const EdgeInsets.only(left: 8),
                leading: SvgPicture.asset('lib/assets/images/Meeting.svg',
                    color: ColorConstants.black, height: 24.r, width: 24.r),
                title: Text(TextConstants.createMeetingText,
                    style: TextStyleConstants.forgotPasswordTextStyle))),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        margin: const EdgeInsets.only(right: 16, top: 4, bottom: 8),
        height: 44.r,
        width: 44.r,
        decoration: BoxDecoration(
          color: ColorConstants.purple,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          Icons.add,
          size: 24.r,
          color: ColorConstants.white,
        ),
      ),
    );
  }

  PersistentBottomSheetController<dynamic> showBottomSheetCreateEvent(
      BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    return showBottomSheet(
        backgroundColor: ColorConstants.scaffoldBackgroundColor,
        elevation: 10,
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width / 2),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorConstants.lightGrey, width: 1.r),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r))),
        context: context,
        builder: (ctx) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(TextConstants.createProjectText,
                          style: TextStyleConstants.appbarTitleTextStyle),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    TextConstants.createWorkspaceNameText,
                    style: TextStyleConstants.headlineTextStyle,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: CredentialFormField(
                      iconLeading: null,
                      label: null,
                      controller: _nameController),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    TextConstants.addMemberToProjectText,
                    style: TextStyleConstants.headlineTextStyle,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      color: ColorConstants.scaffoldBackgroundColor,
                      width: 199.w,
                      height: MediaQuery.of(context).size.height / 11,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ConstantData.memberProfiles.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  ConstantData.memberProfiles[index],
                                ),
                                radius: 28.r,
                              ),
                            );
                          }),
                      //   Icon(
                      //     Icons.add,
                      //     size: 24.r,
                      //     color: ColorConstants.white,
                      //   ),
                      // ],
                      // ),
                    ),
                  ],
                ),
              ]);
        });
  }
}
