import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_users/config/dio/app_dio.dart';
import 'package:reqres_users/controllers/auth_controller.dart';
import 'package:reqres_users/controllers/users_controller.dart';
import 'package:reqres_users/widgets/others/sized_boxes.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _authController = Get.put(AuthController());
  final UsersController _usersController = Get.put(UsersController());

  static const _shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _usersController.dio = AppDio(context);
    _init(context);
  }

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
      body: GetBuilder<UsersController>(
        init: UsersController(),
        builder: (value) => _usersController.loading == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Shimmer(
                      gradient: _shimmerGradient,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  _init(context) async {
    await _usersController.getUsersList(context);
  }
}
