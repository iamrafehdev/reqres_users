import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_users/controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              _authController.logout(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
