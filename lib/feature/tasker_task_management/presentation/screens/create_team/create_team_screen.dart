import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/constant_data.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/label_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/create_project_bottom/widget/member_profile_view_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/project_detail_screen/widget/create_event_headline_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/credentials_field_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/login_button.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> createTeamBottomScreen({required BuildContext context}) {
  TextEditingController nameController = TextEditingController();
  File? image;
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
              headlineText: TextConstants.createTeamText),
          UploadImageWidget(image: image),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Tap the label to upload image',
                style: TextStyle(color: ColorConstants.purple),
              ),
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
          const LabelWidget(text: TextConstants.privacyText),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: CredentialFormField(
              iconLeading: Icons.lock_outline,
              label: 'Private',
              controller: nameController,
              suffixIcon: Icons.arrow_drop_down,
            ),
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

class UploadImageWidget extends StatefulWidget {
  UploadImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  File? image;

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            pickImage((value) {
              setState(() {
                widget.image = value;
              });
            });
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: widget.image != null
                ? CircleAvatar(
                    backgroundImage: Image.file(
                      widget.image!,
                      fit: BoxFit.contain,
                    ).image,
                  )
                : const CircleAvatar(
                    backgroundImage:
                        AssetImage('lib/assets/images/profile.jpeg'),
                  ),
          ),
        ),
      ],
    );
  }
}

Future pickImage(ValueChanged<File?> profile) async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    profile(imageTemporary);
  } on PlatformException catch (e) {
    print(
      'failed to pick image',
    );
  }
}
