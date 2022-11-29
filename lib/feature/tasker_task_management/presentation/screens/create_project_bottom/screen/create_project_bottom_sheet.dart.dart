import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/constant_data.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/data/datasource/remote_data_source/firestore_datasource.dart';
import 'package:task_management/feature/tasker_task_management/data/model/project_model.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/get_all_members/get_all_members_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/project_bloc/project_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/methods/error_dialog.dart';
import 'package:task_management/feature/tasker_task_management/presentation/methods/snack_bar_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/date_time_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/label_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/member_profile_view_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/project_detail_screen/widget/create_event_headline_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/credentials_field_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/login_button.dart';

PersistentBottomSheetController<dynamic> createProjectBottomSheet(
    {required BuildContext context}) {
  final getMembers = BlocProvider.of<GetAllMembersBloc>(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String startDate = DateFormat.yMd().format(DateTime.now());
  String endDate = DateFormat.yMd().format(DateTime.now());
  return showBottomSheet(
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
      builder: (ctx) {
        return BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
          if (state is ProjectInitialState) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CreateEventBottomPageHeadline(
                        headlineText: TextConstants.createProjectText),
                    const LabelWidget(
                      text: TextConstants.createWorkspaceNameText,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: CredentialFormField(
                          iconLeading: null,
                          label: 'Text',
                          controller: nameController),
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
                      startDate: startDate,
                      endDate: endDate,
                      setStartDate: (value) {
                        startDate = value;
                      },
                      setEndDate: (value) {
                        endDate = value;
                      },
                    ),
                    const LabelWidget(text: TextConstants.addLabelText),
                    MemberProfileViewWidget(
                      listData: ConstantData.labelData,
                    ),
                    const LabelWidget(text: TextConstants.descriptionText),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: CredentialFormField(
                          iconLeading: null,
                          label: 'Text',
                          controller: descriptionController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LoginButton(
                          text: TextConstants.createWorkspaceButtonText,
                          icon: Icons.arrow_forward,
                          onPressed: () {
                            BlocProvider.of<ProjectBloc>(context).add(
                                CreateProjectEvent(
                                    projectModel: ProjectModel(
                                        projectName: nameController.text,
                                        description: descriptionController.text,
                                        startDate: startDate,
                                        endDate: endDate,
                                        members:
                                            (getMembers.state as SuccessState)
                                                .selectedMemberList)));
                          }),
                    )
                  ]),
            );
          }
          if (state is ProjectSuccessState) {
            showSnackBarMethod(
              context,
              'Project created successfully',
              TextStyleConstants.registeredSuccessfullyTextStyle,
            );
            AutoRouter.of(context).pop();
          }
          if (state is ProjectFailureState) {
            showDialogForErrror(
                message: state.errorMessage,
                context: context,
                onPressed: () {
                  AutoRouter.of(context).pop();
                });
          }
          ;
          return Container();
        });
      });
}
