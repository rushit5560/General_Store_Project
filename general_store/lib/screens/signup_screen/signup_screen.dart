import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:get/get.dart';

import 'signup_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  // const SignUpPage({Key? key}) : super(key: key);
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> signUpScreenController.isLoading.value
        ? CustomCircularProgressIndicator()
        : SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(),
                  const SpacerHeight(30),
                  LoginAndSignUpText(text: 'Sign Up'),
                  const SpacerHeight(20),
                  NameEmailAndPassFields(),
                  const SpacerHeight(10),
                  SignUpButton(),
                  const SpacerHeight(25),
                  OrLine(),
                  const SpacerHeight(20),
                  SocialButtons(),
                  const SpacerHeight(25),
                  SignInText(),
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
