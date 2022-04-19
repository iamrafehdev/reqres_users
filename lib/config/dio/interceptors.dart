import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:reqres_users/config/funx/shared_preferences/shared_preferences.dart';
import 'package:reqres_users/config/logger/app_logger.dart';

import '../app_urls.dart';
import '../keys/headers.dart';
import '../keys/pref_keys.dart';

class AppDioInterceptor extends Interceptor {
  final BuildContext context;
  String token = "";
  final AppLogger _logger = AppLogger();

  AppDioInterceptor(this.context) {
    Prefs.getPrefs().then((prefs) {
      token = prefs.getString(PrefKey.authorization) ?? "";
    });
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Map<String, dynamic> er = {
      "type": err.type,
      "message": err.message,
      "status_code": err.response?.statusCode,
      "status_message": err.response?.statusMessage,
      "headers": err.response?.headers,
      "data": err.response?.data,
      "response": err.response,
    };
    _logger.e(er);

    if (err.response != null) {
      handler.resolve(err.response!);
    } else {
      handler.next(err);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Map<String, dynamic> er = {
      "base_url": response.requestOptions.baseUrl,
      "end_point": response.requestOptions.path,
      "method": response.requestOptions.method,
      "status_code": response.statusCode,
      "status_message": response.statusMessage,
      "headers": response.headers,
      "data": response.data,
      "extra": response.extra,
      "response": response,
    };
    _logger.i(er);

    handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AppUrls.baseUrl.isEmpty) {
      throw Exception("Base URL is not set");
    }

    options..baseUrl = AppUrls.baseUrl;
    if (token.isNotEmpty) {
      options..headers.addAll({RequestHeader.authorization: "Bearer $token"});
    }

    Map<String, dynamic> er = {
      "base_url": options.baseUrl,
      "end_point": options.path,
      "method": options.method,
      "headers": options.headers,
      "params": options.queryParameters,
      "data": options.data,
      "extra": options.extra,
    };
    _logger.d(er);

    handler.next(options);
  }
}
