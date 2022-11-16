// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void showDialogForErrror(String message, BuildContext context, Type blocToUse, Type triggerEvent) {
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       showDialog(
//         builder: (context) => Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: AlertDialog(
//             scrollable: true,
//             content: Text(message),
//             actions: [
//               TextButton(
//                 child: const Text('OK'),
//                 onPressed: () {
//                   AutoRouter.of(context).pop();
//                   BlocProvider.of<blocToUse>(context)
//                       .add(triggerEvent);
//                 },
//               )
//             ],
//           ),
//         ),
//         context: context,
//       );
//     });
//   }
  
