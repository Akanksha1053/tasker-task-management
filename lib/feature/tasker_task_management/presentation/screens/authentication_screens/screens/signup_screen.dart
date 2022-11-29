import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/methods/error_dialog.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/widget/bottom_sign_up_or_in_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/widget/divider_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/widget/login_option_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/credentials_field_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/login_button.dart';
import 'package:task_management/feature/tasker_task_management/presentation/methods/snack_bar_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _saveForm() {
    if (_passwordController.text == _confirmPasswordController.text) {
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
    } else {
      return false;
    }
  }

  void clearTextFields() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is InitialState) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(height: 10),
                            const Text(
                              TextConstants.signUpText,
                              style: TextStyleConstants.signUpHeadTextStyle,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 20),
                            CredentialFormField(
                                iconLeading: Icons.email_outlined,
                                label: 'email',
                                controller: _emailController),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 30),
                            CredentialFormField(
                                iconLeading: Icons.lock,
                                label: 'Password',
                                suffixIcon: Icons.remove_red_eye_outlined,
                                controller: _passwordController),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 30),
                            CredentialFormField(
                                iconLeading: Icons.lock,
                                label: 'Confirm Password',
                                suffixIcon: Icons.remove_red_eye_outlined,
                                controller: _confirmPasswordController),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 20),
                            LoginButton(
                              onPressed: () {
                                if (_saveForm()) {
                                  BlocProvider.of<AuthenticationBloc>(context,
                                          listen: false)
                                      .add(CreateUserEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                } else {
                                  showDialogForErrror(
                                      context: context,
                                      message: TextConstants
                                          .passwordAndConfirmUnmatched,
                                      onPressed: () {
                                        AutoRouter.of(context).pop();
                                        BlocProvider.of<AuthenticationBloc>(
                                                context)
                                            .add(AuthenticationResetEvent());
                                      });
                                }
                              },
                              text: TextConstants.signUpText,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: DividerWidget(
                                  text: TextConstants.orSignUpWithText),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  LoginOptionWidget(
                                      icon: Icons.facebook_outlined),
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
                            // Spacer(),
                          ]),
                    ),
                  ),
                );
              }
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SuccessfulState) {
                clearTextFields();
                showSnackBarMethod(
                    context,
                    TextConstants.registeredSuccessfullyText,
                    TextStyleConstants.registeredSuccessfullyTextStyle);
                AutoRouter.of(context).push(const SignInScreenRoute());
              } else if (state is AuthenticationFailure) {
                showDialogForErrror(
                    message: state.message,
                    context: context,
                    onPressed: () {
                      AutoRouter.of(context).pop();
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(AuthenticationResetEvent());
                    });
                clearTextFields();
              }
              return Container();
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.28,
            left: 60,
            child: SignUpOrInOption(
                buttonText: TextConstants.signInText,
                buttonTextStyle: TextStyleConstants.signInTextStyle,
                route: const SignInScreenRoute(),
                staticText: TextConstants.alreadyHaveAnAccountText,
                staticTextStyle:
                    TextStyleConstants.alreadyHaveAnAccountTextStyle),
          ),
        ],
      ),
    );
  }
}
