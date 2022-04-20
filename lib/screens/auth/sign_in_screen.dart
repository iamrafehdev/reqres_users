import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_users/config/dio/app_dio.dart';
import 'package:reqres_users/controllers/auth_controller.dart';
import 'package:reqres_users/widgets/button/app_button.dart';
import 'package:reqres_users/widgets/fields/icon_field.dart';
import 'package:reqres_users/widgets/fields/password_field.dart';
import 'package:reqres_users/widgets/others/app_text.dart';
import 'package:reqres_users/widgets/others/sized_boxes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController _authController = Get.put(AuthController());
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authController.logger.init();
    _authController.dio = AppDio(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _loginFormKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    'Login to Continue',
                    size: 28.0,
                    bold: true,
                  ),
                  SizeBoxHeight32(),
                  AppIconField(
                    controller: _authController.emailController,
                    label: 'Email',
                  ),
                  SizeBoxHeight8(),
                  AppPasswordField(
                    controller: _authController.passwordController,
                    label: 'Password',
                  ),
                  SizeBoxHeight16(),
                  AppButton(
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        _authController.signIn(context);
                      }
                    },
                    text: 'SignIn',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
