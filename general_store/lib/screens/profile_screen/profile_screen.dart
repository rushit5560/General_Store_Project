import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_screen_controller/profile_screen_controller.dart';
import 'profile_screen_widgets.dart';

class ProfileScreen extends StatelessWidget {
  final profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerAndUserNameModule(),
            Transform(
              transform: Matrix4.translationValues(0, -Get.height * 0.085, 0),
              child: UserProfileDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
