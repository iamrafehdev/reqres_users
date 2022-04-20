import 'package:get/get.dart';
import 'package:reqres_users/screens/auth/sign_in_screen.dart';
import 'package:reqres_users/screens/auth/sign_up_screen.dart';
import 'package:reqres_users/screens/home_screen.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/signIn',
      page: () => SignInScreen(),
    ),
    GetPage(
      name: '/signUp',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
  ];
}
