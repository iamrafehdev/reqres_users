import 'package:fialogs/fialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_users/config/dio/app_dio.dart';
import 'package:reqres_users/config/fun_x/functions/extensions.dart';
import 'package:reqres_users/config/fun_x/shared_preferences/shared_preferences.dart';
import 'package:reqres_users/config/keys/pref_keys.dart';
import 'package:reqres_users/config/keys/response_code.dart';
import 'package:reqres_users/config/logger/app_logger.dart';
import 'package:reqres_users/resources/app_urls.dart';
import 'package:reqres_users/screens/home_screen.dart';
import 'package:reqres_users/widgets/dialogs/functions.dart';

class AuthController extends GetxController {
  late AppDio dio;
  final AppLogger logger = AppLogger();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loading = false;

  @override
  void onInit() {
    super.onInit();
    logger.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  signIn(context) async {
    _loading = true;
    waitDialog(context, 'Please wait...');
    var responseData;
    try {
      var response = await dio.postJson(path: AppUrls.signIn, data: {
        "email": emailController.getText(),
        "password": passwordController.getText(),
      });

      var responseStatusCode = response.statusCode;
      responseData = response.data;

      if (responseStatusCode == StatusCode.OK) {
        if (_loading) {
          Get.back();
          _loading = false;
        }
        String authToken = responseData['token'];
        logger.i(responseData);
        await Prefs.getPrefs().then((prefs) {
          prefs.setString(PrefKey.authorization, authToken);
          prefs.setBool(PrefKey.firstTimeLogin, false);
        });
        await Get.offAll(HomeScreen());
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
