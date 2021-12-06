import 'package:flutter/material.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/field_validation.dart';
import 'package:general_store/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:general_store/screens/signin_screen/signin_screen.dart';
import 'package:get/get.dart';

class NameEmailAndPassFields extends StatelessWidget {
  NameEmailAndPassFields({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: signUpScreenController.formKey,
        child: Column(
          children: [
            UserNameTextField(),
            const SpacerHeight(20),
            EmailTextField(),
            const SpacerHeight(20),
            PasswordTextField(),
            const SpacerHeight(20),
          ],
        ),
      ),
    );
  }
}
class UserNameTextField extends StatelessWidget {
  UserNameTextField({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kPinkColor,
      controller: signUpScreenController.userNameFieldController,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: formInputDecoration('User Name'),
    );
  }
}
class EmailTextField extends StatelessWidget {
  EmailTextField({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kPinkColor,
      controller: signUpScreenController.emailIdFieldController,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: formInputDecoration('Email Id'),
    );
  }
}
class PasswordTextField extends StatelessWidget {
  PasswordTextField({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kPinkColor,
      obscureText: true,
      controller: signUpScreenController.passwordFieldController,
      validator: (value) => FieldValidator().validatePassword(value!),
      decoration: formInputDecoration('Password'),
    );
  }
}

class SignUpButton extends StatelessWidget {
  SignUpButton({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          if(signUpScreenController.formKey.currentState!.validate()){
            signUpScreenController.getRegisterData(
              "${signUpScreenController.userNameFieldController.text.trim()}",
              "${signUpScreenController.emailIdFieldController.text.trim().toLowerCase()}",
              "${signUpScreenController.passwordFieldController.text.trim()}",
            );

          }
        },
        child: Container(
          width: Get.width,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColor.kPinkColor,
          ),
          child: Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already Have Account.',
          style: TextStyle(fontSize: 16),
        ),
        SpacerWidth(3),
        GestureDetector(
          onTap: () => Get.off(() => SignInScreen()),
          child: Text(
            'Sign In',
            style: TextStyle(
              color: AppColor.kPinkColor,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}



