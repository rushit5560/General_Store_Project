import 'package:flutter/material.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/field_validation.dart';
import 'package:general_store/controllers/signin_screen_controller/signin_screen_controller.dart';
import 'package:general_store/screens/signup_screen/signup_screen.dart';
import 'package:get/get.dart';

class EmailAndPasswordFields extends StatelessWidget {
  EmailAndPasswordFields({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: signInScreenController.formKey,
        child: Column(
          children: [
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
class EmailTextField extends StatelessWidget {
  EmailTextField({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kPinkColor,
      controller: signInScreenController.emailIdFieldController,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: formInputDecoration('Email Id'),
    );
  }
}
class PasswordTextField extends StatelessWidget {
  PasswordTextField({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kPinkColor,
      obscureText: true,
      controller: signInScreenController.passwordFieldController,
      validator: (value) => FieldValidator().validatePassword(value!),
      decoration: formInputDecoration('Password'),
    );
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          if(signInScreenController.formKey.currentState!.validate()){
            print(
                'Email : ${signInScreenController.emailIdFieldController.text.trim()} '
                    '\nPassword : ${signInScreenController.passwordFieldController.text.trim()}'
            );
            signInScreenController.getSignInData(
              "${signInScreenController.emailIdFieldController.text.trim().toLowerCase()}",
              "${signInScreenController.passwordFieldController.text.trim()}",
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
              'Login',
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

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Haven\'t Account.',
          style: TextStyle(fontSize: 16),
        ),
        SpacerWidth(3),
        GestureDetector(
          onTap: () => Get.off(() => SignUpScreen()),
          child: Text(
            'Sign Up',
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
