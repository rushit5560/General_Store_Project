import 'package:flutter/material.dart';
import 'package:general_store/common/img_url.dart';
import 'package:get/get.dart';

import '../../controllers/splash_screen_controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  // const SplashPage({Key? key}) : super(key: key);
  SplashScreenController splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImgUrl.splash),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
