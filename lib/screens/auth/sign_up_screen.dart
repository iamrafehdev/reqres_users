import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_users/config/dio/app_dio.dart';
import 'package:reqres_users/controllers/auth_controller.dart';
import 'package:reqres_users/widgets/button/app_button.dart';
import 'package:reqres_users/widgets/fields/icon_field.dart';
import 'package:reqres_users/widgets/fields/password_field.dart';
import 'package:reqres_users/widgets/others/app_text.dart';
import 'package:reqres_users/widgets/others/sized_boxes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController _authController = Get.put(AuthController());
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authController.dio = AppDio(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: SingleChildScrollView(
              child: Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    Text(
                      "SignUp to Continue",
                      style: TextStyle(fontSize: 32),
                    ),
                    SizeBoxHeight16(),
                    AppIconField(
                      label: "Email Address",
                      controller: _authController.emailController,
                      validator: (value) {
                        if (value!.isEmpty) return "Required";
                        return null;
                      },
                    ),
                    SizeBoxHeight16(),
                    AppPasswordField(
                      label: "Password",
                      controller: _authController.passwordController,
                      validator: (value) {
                        if (value!.isEmpty) return "Required";
                        return null;
                      },
                    ),
                    SizeBoxHeight16(),
                    AppButton(
                      width: MediaQuery.of(context).size.width,
                      text: "Sign Up",
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          _authController.signIn(context);
                        }
                      },
                    ),
                    SizeBoxHeight16(),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: AppText("Already have an account? SignIn"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
