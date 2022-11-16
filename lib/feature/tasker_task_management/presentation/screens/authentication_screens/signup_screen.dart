import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/bottom_sign_up_or_in_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/credentials_field_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/divider_widget.dart';
import 'package:task_management/feature/tasker_task_management/presentation/widgets/sign_in_up_widgets/login_option_widget.dart';
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

  void showDialogForErrror(String message, BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            scrollable: true,
            content: Text(message),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  AutoRouter.of(context).pop();
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(AuthenticationResetEvent());
                },
              )
            ],
          ),
        ),
        context: context,
      );
    });
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.appbarBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is InitialState) {
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
                          TextConstants.signUpText,
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),
                        CredentialFormField(
                            iconLeading: Icons.lock,
                            label: 'Confirm Password',
                            suffixIcon: Icons.remove_red_eye_outlined,
                            controller: _confirmPasswordController),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConstants.purple),
                          child: TextButton(
                              onPressed: () async {
                                if (_saveForm()) {
                                  BlocProvider.of<AuthenticationBloc>(context,
                                          listen: false)
                                      .add(CreateUserEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                } else {
                                  showDialogForErrror(
                                      TextConstants.passwordAndConfirmUnmatched,
                                      context);
                                }
                              },
                              child: Text(TextConstants.signUpText,
                                  style: TextStyleConstants
                                      .signupButtonTextStyle)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        const DividerWidget(
                            text: TextConstants.orSignUpWithText),
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
                          height: 50.h,
                        ),
                        SignUpOrInOption(
                            buttonText: TextConstants.signInText,
                            buttonTextStyle: TextStyleConstants.signInTextStyle,
                            route: const SignInScreenRoute(),
                            staticText: TextConstants.alreadyHaveAnAccountText,
                            staticTextStyle: TextStyleConstants
                                .alreadyHaveAnAccountTextStyle),
                      ]),
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
              showDialogForErrror(state.message, context);
              clearTextFields();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
