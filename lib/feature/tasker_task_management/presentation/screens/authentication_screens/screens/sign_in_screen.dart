import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/signin_bloc/sign_in_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/methods/error_dialog.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/widget/bottom_sign_up_or_in_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/widget/divider_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/screens/authentication_screens/widget/login_option_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/credentials_field_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/login_button.dart';
import 'package:task_management/feature/tasker_task_management/presentation/methods/snack_bar_widget.dart';

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
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorConstants.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorConstants.black, //change your color here
        ),
        automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
      ),
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInInitialState) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
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
                                    AutoRouter.of(context).push(
                                        const ForgotPasswordScreenRoute());
                                  },
                                  child: Text(TextConstants.forgotPassword,
                                      style: TextStyleConstants
                                          .forgotPasswordTextStyle)),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 30),
                          LoginButton(
                              text: TextConstants.signInText,
                              onPressed: () async {
                                if (_saveForm()) {
                                  BlocProvider.of<SignInBloc>(context).add(
                                      SignInUserEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                }
                              }),
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
                          SignUpOrInOption(
                              buttonText: TextConstants.signUpText,
                              buttonTextStyle:
                                  TextStyleConstants.signInTextStyle,
                              route: const SignUpScreenRoute(),
                              staticText: TextConstants.notHavinAnAccountText,
                              staticTextStyle: TextStyleConstants
                                  .alreadyHaveAnAccountTextStyle),
                        ]),
                  ),
                ),
              ),
            );
          }
          if (state is SignInLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SignInSuccessfulState) {
            showSnackBarMethod(context, TextConstants.signedInSuccessfullyText,
                TextStyleConstants.registeredSuccessfullyTextStyle);
            AutoRouter.of(context).push(const CreateWorkspaceScreenRoute());
          } else if (state is SignInFailure) {
            showDialogForErrror(
                context: context,
                message: state.message,
                onPressed: () {
                  AutoRouter.of(context).pop();
                  BlocProvider.of<SignInBloc>(context).add(SignInResetEvent());
                });
            clearTextFields();
          }
          return Container();
        },
      ),
    );
  }
}
