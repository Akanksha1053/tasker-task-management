import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/credentials_field_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/login_button.dart';

class CreateWorkspaceScreen extends StatefulWidget {
  const CreateWorkspaceScreen({super.key});

  @override
  State<CreateWorkspaceScreen> createState() => _CreateWorkspaceScreenState();
}

class _CreateWorkspaceScreenState extends State<CreateWorkspaceScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noOfMemberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          TextConstants.createWorkspaceTitleText,
          style: TextStyleConstants.appbarTitleTextStyle,
        ),
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(TextConstants.createWorkspaceNameText,
                style: TextStyleConstants.headlineTextStyle),
            SizedBox(
              height: 32.h,
            ),
            CredentialFormField(
                iconLeading: Icons.person_outline,
                label: 'Name',
                controller: _nameController),
            SizedBox(
              height: 32.h,
            ),
            Text(TextConstants.createWorkspaceMemberText,
                style: TextStyleConstants.headlineTextStyle),
            SizedBox(
              height: 32.h,
            ),
            CredentialFormField(
                iconLeading: Icons.group_add_outlined,
                label: 'Members',
                controller: _noOfMemberController),
            SizedBox(
              height: 32.h,
            ),
            Text(TextConstants.createWorkspaceEmailText,
                style: TextStyleConstants.headlineTextStyle),
            SizedBox(
              height: 32.h,
            ),
            CredentialFormField(
                iconLeading: Icons.email,
                label: 'Email',
                controller: _emailController),
            SizedBox(
              height: 32.h,
            ),
            LoginButton(
                text: TextConstants.createWorkspaceButtonText,
                onPressed: () {
                  AutoRouter.of(context).push(const ChoosePlanScreenRoute());
                }),
          ]),
        ),
      ),
    );
  }
}
