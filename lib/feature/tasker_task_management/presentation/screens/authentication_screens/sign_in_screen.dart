import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/signin_bloc/sign_in_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/bottom_sign_up_or_in_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/credentials_field_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/divider_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/login_option_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/methods/snack_bar_widget.dart';

import '../../methods/sign_in_error_dialog.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _saveForm() {
    try {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        _formKey.currentState!.save();
        return true;
      }
      return false;
    } catch (exception) {
      return false;
    }
  }

  void clearTextFields() {
    // _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorConstants.black, //change your color here
        ),
        automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is SignInInitialState) {
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        const Text(
                          TextConstants.signInText,
                          style: TextStyleConstants.signUpHeadTextStyle,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        CredentialFormField(
                            iconLeading: Icons.email_outlined,
                            label: 'email',
                            controller: _emailController),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),
                        CredentialFormField(
                            iconLeading: Icons.lock,
                            label: 'Password',
                            suffixIcon: Icons.remove_red_eye_outlined,
                            controller: _passwordController),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      ColorConstants.black),
                                ),
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(const ForgotPasswordScreenRoute());
                                },
                                child: Text(TextConstants.forgotPassword,
                                    style: TextStyleConstants
                                        .forgotPasswordTextStyle)),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: ColorConstants.purple),
                          child: TextButton(
                              onPressed: () async {
                                if (_saveForm()) {
                                  BlocProvider.of<SignInBloc>(context).add(
                                      SignInUserEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                }
                              },
                              child: Text(TextConstants.signInText,
                                  style: TextStyleConstants
                                      .signupButtonTextStyle)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        const DividerWidget(
                            text: TextConstants.orSignInWithText),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              LoginOptionWidget(icon: Icons.facebook_outlined),
                              SizedBox(
                                width: 16,
                              ),
                              LoginOptionWidget(icon: Icons.apple_outlined),
                              SizedBox(
                                width: 16,
                              ),
                              LoginOptionWidget(
                                  icon: Icons.g_mobiledata_outlined)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                        SignUpOrInOption(
                            buttonText: TextConstants.signUpText,
                            buttonTextStyle: TextStyleConstants.signInTextStyle,
                            route: const SignUpScreenRoute(),
                            staticText: TextConstants.notHavinAnAccountText,
                            staticTextStyle: TextStyleConstants
                                .alreadyHaveAnAccountTextStyle),
                      ]),
                ),
              );
            }
            if (state is SignInLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SignInSuccessfulState) {
              showSnackBarMethod(
                  context,
                  TextConstants.signedInSuccessfullyText,
                  TextStyleConstants.registeredSuccessfullyTextStyle);
              // AutoRouter.of(context).pop();
              AutoRouter.of(context).push(const CreateWorkspaceScreenRoute());
            } else if (state is SignInFailure) {
              showErrorDialogSignIn(context, state);
              clearTextFields();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
