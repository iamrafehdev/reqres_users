import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reqres_users/config/fun_x/shared_preferences/shared_preferences.dart';
import 'package:reqres_users/config/keys/pref_keys.dart';
import 'package:reqres_users/resources/app_theme.dart';
import 'package:reqres_users/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Prefs.getPrefs().then((prefs) {
    bool firstTimeLogin = prefs.getBool(PrefKey.firstTimeLogin) ?? true;
    String authToken = prefs.getString(PrefKey.authorization) ?? "";
    runApp(
      GetMaterialApp(
        theme: AppTheme.ReqResUserThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute:
            !firstTimeLogin && authToken.isNotEmpty ? '/home' : '/signIn',
        getPages: Routes.routes,
      ),
    );
  });
}
