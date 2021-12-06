import 'package:flutter/material.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/screens/signin_screen/signin_screen.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  // const SignUpPage({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              SpacerHeight(30),
              signUpText(),
              SpacerHeight(20),
              userNameEmailPassFields(),
              SpacerHeight(10),
              signUpButton(),
              SpacerHeight(25),
              orLine(),
              SpacerHeight(20),
              socialButtons(),
              SpacerHeight(25),
              signInText(),
              SpacerHeight(10),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Image(
      image: AssetImage(ImgUrl.logo),
      width: Get.width * 0.6,
    );
  }

  Widget signUpText() {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget userNameEmailPassFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            userNameField(),
            SpacerHeight(20),
            emailIdField(),
            SpacerHeight(20),
            passwordField(),
            SpacerHeight(20),
          ],
        ),
      ),
    );
  }

  Widget userNameField() {
    return TextFormField(
      cursorColor: AppColor.kPinkColor,
      controller: userNameController,
      validator: (value){
        if(value!.isEmpty){
          return 'UserName Should not be Empty';
        }
        if(value.length < 6){
          return 'UserName should be Atleast 6 Character';
        }
      },
      decoration: InputDecoration(
        hintText: 'User Name',
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget emailIdField() {
    return TextFormField(
      cursorColor: AppColor.kPinkColor,
      controller: emailIdController,
      validator: (value){
        if(value!.isEmpty){
          return 'Email Id Should not be Empty';
        }
        else if(!value.contains('@')){
          return 'Email should be valid!';
        }
      },
      decoration: InputDecoration(
        hintText: 'Email Id',
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      cursorColor: AppColor.kPinkColor,
      obscureText: true,
      controller: passwordController,
      validator: (value){
        if(value!.isEmpty){
          return 'Password Should not be Empty';
        }
      },
      decoration: InputDecoration(
        hintText: 'Password',
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          if(formKey.currentState!.validate()){
            print(
                'UserName : ${userNameController.text.trim()} '
                'Email : ${emailIdController.text.trim()} '
                    '\nPassword : ${passwordController.text.trim()}'
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

  Widget orLine() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1, color: Colors.black,
            indent: 30, endIndent: 8,
          ),
        ),
        Text(
          'OR',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1, color: Colors.black,
            indent: 8, endIndent: 30,
          ),
        ),
      ],
    );
  }

  Widget socialButtons() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => print('----Clicked On FB Button----'),
            child: Container(
              height: 45, width: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImgUrl.fb),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),

          SpacerWidth(10),

          GestureDetector(
            onTap: () => print('----Clicked On Google Button----'),
            child: Container(
              height: 45, width: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImgUrl.google),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),

          SpacerWidth(10),

          GestureDetector(
            onTap: () => print('----Clicked On LinkedIn Button----'),
            child: Container(
              height: 45, width: 45,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImgUrl.linkedin),
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInText() {
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
