import 'package:dio/dio.dart';
import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:reqres_users/config/fun_x/functions/try_catch.dart';

notConnectedDialog(BuildContext context) {
  errorDialog(
    context,
    "Connectivity!",
    "It looks like you are not connected to the internet. Please check you internet connection and try again...",
  );
}

waitDialog(BuildContext context, String message) {
  progressDialog(
    context,
    progressDialogType: ProgressDialogType.CIRCULAR,
    contentWidget: Text("$message"),
  );

}

// responseErrorDialog(BuildContext context, Response response) {
//   errorDialog(
//     context,
//     "Error ${response.statusCode}",
//     "${response.statusMessage}",
//     positiveButtonText: "Details",
//     positiveButtonAction: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) {
//             return WidgetViewScreen(
//               widget: Text("${response.data.toString()}"),
//               title: "Response Details",
//             );
//           },
//         ),
//       );
//     },
//     closeOnBackPress: true,
//   );
// }
//
// exceptionDialog(BuildContext context, Exception exception) {
//   errorDialog(
//     context,
//     "Error",
//     "Something went wrong, for more info click the details button!",
//     positiveButtonText: "Details",
//     positiveButtonAction: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) {
//             return WidgetViewScreen(
//               widget: Text("${exception.toString()}"),
//               title: "Response Details",
//             );
//           },
//         ),
//       );
//     },
//     closeOnBackPress: true,
//   );
// }
//
// errorDetailsDialog(BuildContext context, dynamic error) {
//   errorDialog(
//     context,
//     "Error",
//     "Something went wrong, for more info click the details button!",
//     positiveButtonText: "Details",
//     positiveButtonAction: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) {
//             return WidgetViewScreen(
//               widget: Text("${error.toString()}"),
//               title: "Response Details",
//             );
//           },
//         ),
//       );
//     },
//     closeOnBackPress: true,
//   );
// }

screenMaxWidth(Size screenSize) {
  return screenSize.width > 600.0 ? 550.0 : screenSize.width;
}

responseTryCatch(BuildContext context, void Function() action) async {
  tryCatch(
    context,
    action: action,
    socketException: (e, s) {
      errorDialog(context, "Error", "${e.toString()}");
    },
    formatException: (e, s) {
      errorDialog(context, "Error", "${e.toString()}");
    },
    platformException: (e, s) {
      errorDialog(context, "Error", "${e.toString()}");
    },
    exception: (e, s) {
      errorDialog(context, "Error", "${e.toString()}");
    },
    error: (e, s) {
      errorDialog(context, "Error", "${e.toString()}");
    },
    otherCatch: (e, s) {
      errorDialog(context, "Error", "${e.toString()}");
    },
  );
}
