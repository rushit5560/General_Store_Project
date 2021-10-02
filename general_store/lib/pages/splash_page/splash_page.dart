import 'package:flutter/material.dart';
import 'package:general_store/common/img_url.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  // const SplashPage({Key? key}) : super(key: key);
  SplashController splashController = Get.put(SplashController());

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
