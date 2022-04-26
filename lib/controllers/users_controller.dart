import 'package:fialogs/fialogs.dart';
import 'package:get/get.dart';
import 'package:reqres_users/config/dio/app_dio.dart';
import 'package:reqres_users/config/keys/response_code.dart';
import 'package:reqres_users/config/logger/app_logger.dart';
import 'package:reqres_users/resources/app_urls.dart';

class UsersController extends GetxController {
  late AppDio dio;
  final AppLogger logger = AppLogger();
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    logger.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getUsersList(context) async {
    loading = true;
    var responseData;
    try {
      var response = await dio.get(
        path: AppUrls.getUsersList,
      );


      var responseStatusCode = response.statusCode;
      responseData = response.data;

      if (responseStatusCode == StatusCode.OK) {
        loading = false;
        update();
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
