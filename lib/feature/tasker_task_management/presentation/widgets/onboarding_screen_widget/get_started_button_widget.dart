// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tasker_task_management/core/constants/text_constants.dart';
// import 'package:tasker_task_management/core/constants/text_style_constants.dart';
// import 'package:tasker_task_management/core/router/auto_router.gr.dart';

// class GetStartedButtonWidget extends StatelessWidget {
//   const GetStartedButtonWidget({
//     required this.context1,
//     Key? key,
//   }) : super(key: key);
//   final BuildContext context1;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: 20.h),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width / 1.2,
//             height: MediaQuery.of(context).size.height / 15,
//             child: TextButton(
//               onPressed: () {
//                 AutoRouter.of(context1).push(const SignUpScreenRoute());
//               },
//               style: TextStyleConstants.getStartedButtonStyle,
//               child: Text(
//                 TextConstants.getStartedButtonText,
//                 style: TextStyleConstants.getStartedButtonTextStyle,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 30.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               TextConstants.alreadyHaveAnAccountText,
//               style: TextStyleConstants.alreadyHaveAnAccountTextStyle,
//             ),
//             TextButton(
//                 onPressed: null,
//                 child: Text(
//                   TextConstants.signInText,
//                   style: TextStyleConstants.signInTextStyle,
//                 ))
//           ],
//         )
//       ],
//     );
//   }
// }
