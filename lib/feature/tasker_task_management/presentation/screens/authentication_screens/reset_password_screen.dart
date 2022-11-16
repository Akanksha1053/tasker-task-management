import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/credentials_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _resetformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _resetformKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  height: MediaQuery.of(context).size.height / 4,
                  image: const AssetImage(
                    'lib/assets/images/forgot_pwd.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Text(
                    TextConstants.resetPassword,
                    style: TextStyleConstants.appbarTitleTextStyle,
                  ),
                ),
                CredentialFormField(
                    iconLeading: Icons.lock,
                    label: 'Password',
                    suffixIcon: Icons.remove_red_eye_outlined,
                    controller: _passwordController),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                CredentialFormField(
                    iconLeading: Icons.lock,
                    label: 'Confirm Password',
                    suffixIcon: Icons.remove_red_eye_outlined,
                    controller: _confirmPasswordController),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Container(
                  height: MediaQuery.of(context).size.height / 12,
                  margin: const EdgeInsets.only(left: 24, right: 24),
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 8, bottom: 8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.purple),
                  child: TextButton(
                      onPressed: () {
                        AutoRouter.of(context)
                            .popUntilRouteWithName('SignInScreenRoute');
                      },
                      child: Text(TextConstants.saveChanges,
                          style: TextStyleConstants.signupButtonTextStyle)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
