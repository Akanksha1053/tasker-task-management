import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/auto_route/auto_route.gr.dart';
import 'package:task_management/core/constants/color_constants.dart';
import 'package:task_management/core/constants/text_constants.dart';
import 'package:task_management/core/constants/text_style_constants.dart';
import 'package:task_management/feature/tasker_task_management/presentation/bloc/authentication_bloc/authentication_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String phoneNumber = '+91';
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
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is InitialState) {
                return Column(
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
                        TextConstants.forgotPassword,
                        style: TextStyleConstants.appbarTitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Text(
                        TextConstants.sendOtpToNumberText,
                        style: TextStyleConstants.bodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        onTap: () {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (value.length < 10 || value.length > 10) {
                            return 'Please Enter a valid phone number';
                          } else {
                            phoneNumber = phoneNumber + value;
                            return null;
                          }
                        },
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        autofocus: true,
                        focusNode: _focusNode,
                        controller: _controller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            errorBorder:
                                TextStyleConstants.phoneNumberTextBorder,
                            focusedBorder:
                                TextStyleConstants.phoneNumberTextBorder,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Icon(
                                Icons.phone_outlined,
                                color: ColorConstants.purple,
                              ),
                            ),
                            hintText: 'Phone Number',
                            labelStyle: const TextStyle(fontSize: 15),
                            border: TextStyleConstants.phoneNumberTextBorder),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConstants.purple),
                      child: TextButton(
                          style: TextStyleConstants.getStartedButtonStyle,
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                                OtpAuthenticationEvent(
                                    phoneNumber: phoneNumber));
                          },
                          child: Text(TextConstants.sendOtpText,
                              style: TextStyleConstants.signupButtonTextStyle)),
                    ),
                  ],
                );
              } else if (state is OtpAuthenticationSuccessState) {
                AutoRouter.of(context).push(const OtpScreenRoute());
              } else if (state is AuthenticationFailure) {
                AutoRouter.of(context)
                    .popAndPush(const ForgotPasswordScreenRoute());
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
