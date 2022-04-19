import 'package:dio/dio.dart';
import 'package:fialogs/fialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:reqres_users/config/keys/response_code.dart';

responseError(BuildContext context, Response response) {
  if (StatusCode.isBadRequest(response.statusCode!)) {
    errorDialog(
        context, "Bad Request", "${response.data[ResponseAttrs.MESSAGE]}");
  } else if (StatusCode.isServerError(response.statusCode!)) {
    errorDialog(
        context, "Server Error", "${response.data[ResponseAttrs.MESSAGE]}");
  } else {
    errorDialog(context, "Error", "${response.data[ResponseAttrs.MESSAGE]}");
  }
}
