import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/constant_data.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/date_time_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/label_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/member_profile_view_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/project_detail_screen/widget/create_event_headline_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/credentials_field_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/login_button.dart';

Future<dynamic> createTaskBottomScreen(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  String startDate = DateFormat.yMd().format(DateTime.now());
  String endDate = DateFormat.yMd().format(DateTime.now());
  return showModalBottomSheet(
    backgroundColor: ColorConstants.scaffoldBackgroundColor,
    elevation: 10,
    constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
        minWidth: MediaQuery.of(context).size.width / 2),
    shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorConstants.lightGrey, width: 1.r),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r), topRight: Radius.circular(50.r))),
    context: context,
    builder: ((context) {
      return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CreateEventBottomPageHeadline(
              headlineText: TextConstants.createTaskText),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                'Project',
                style: TextStyleConstants.bodyTextStyle,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                TextConstants.projectName,
                style: TextStyle(
                    color: ColorConstants.purple, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                'lib/assets/images/Drop down.svg',
                color: ColorConstants.black,
              ),
              const Spacer()
            ],
          ),
          const LabelWidget(
            text: TextConstants.createWorkspaceNameText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: CredentialFormField(
                iconLeading: null, label: 'Text', controller: nameController),
          ),
          const LabelWidget(
            text: TextConstants.addMemberToProjectText,
          ),
          MemberProfileViewWidget(
            listData: ConstantData.memberProfiles,
          ),
          const LabelWidget(
            text: TextConstants.dateAndTimeText,
          ),
          DateAndTimeWidget(
            endDate: endDate,
            setStartDate: (value) {
              startDate = value;
            },
            setEndDate: (value) {
              endDate = value;
            },
            startDate: startDate,
          ),
          const LabelWidget(text: TextConstants.addLabelText),
          MemberProfileViewWidget(
            listData: ConstantData.labelData,
          ),
          const LabelWidget(text: TextConstants.descriptionText),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: CredentialFormField(
                iconLeading: null, label: 'Text', controller: nameController),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LoginButton(
                text: TextConstants.createWorkspaceButtonText,
                icon: Icons.arrow_forward,
                onPressed: () {}),
          )
        ]),
      );
    }),
  );
}
