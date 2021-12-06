import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/signin_screen_controller/signin_screen_controller.dart';
import 'package:get/get.dart';

import 'signin_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => signInScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    height: Get.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Logo(),
                        const SpacerHeight(30),
                        LoginAndSignUpText(text: 'Login'),
                        const SpacerHeight(20),
                        EmailAndPasswordFields(),
                        const SpacerHeight(10),
                        LoginButton(),
                        const SpacerHeight(25),
                        OrLine(),
                        const SpacerHeight(20),
                        SocialButtons(),
                        const SpacerHeight(25),
                        SignUpText(),
                        const SpacerHeight(10),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

}
