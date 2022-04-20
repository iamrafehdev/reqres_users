import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reqres_users/resources/app_theme.dart';
import 'package:reqres_users/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      theme: AppTheme.ReqResUserThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: '/signIn',
        getPages: Routes.routes),
  );
}
