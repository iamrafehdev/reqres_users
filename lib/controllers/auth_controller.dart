import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_users/config/dio/app_dio.dart';
import 'package:reqres_users/config/keys/response_code.dart';
import 'package:reqres_users/config/logger/app_logger.dart';
import 'package:reqres_users/resources/app_urls.dart';

class AuthController extends GetxController {
  late AppDio dio;
  final AppLogger logger = AppLogger();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  signIn(context) async {
    var responseData;
    try {
      var response = await dio.post(
        path: AppUrls.signIn,
      );
      var responseStatusCode = response.statusCode;
      responseData = response.data;

      if (responseStatusCode == StatusCode.OK) {
        var data = responseData['data'];
        print(data);
        // await Prefs.getPrefs().then((prefs) {
        //   prefs.setInt(PrefKey.userId, data['id']);
        //   prefs.setBool(PrefKey.firstTimeGetProfile, false);
        // });
      } else {
        if (responseData != null) {
          errorDialog(context, "Error", responseData['error'],
              closeOnBackPress: true, neutralButtonText: "Okay");
        } else {
          errorDialog(
              context, "Error", "Something went wrong please try again later",
              closeOnBackPress: true, neutralButtonText: "Okay");
        }
      }
    } catch (e, s) {
      logger.e(e);

      logger.e(s);
      errorDialog(
          context, "Error", "Something went wrong please try again later",
          closeOnBackPress: true, neutralButtonText: "Okay");
    }
  }
}
