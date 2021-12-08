import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:get/get.dart';
import '../../controllers/profile_screen_controller/profile_screen_controller.dart';
import 'profile_screen_widgets.dart';

class ProfileScreen extends StatelessWidget {
  final profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Profile'),
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
