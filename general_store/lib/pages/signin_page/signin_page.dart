import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/pages/signup_page/signup_page.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  // const SignInPage({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            mainAxisSize: MainAxisSize.max,
            children: [
              logo(),
              SpacerHeight(30),
              loginText(),
              SpacerHeight(20),
              emailAndPassFields(),
              SpacerHeight(10),
              loginButton(),
              SpacerHeight(25),
              orLine(),
              SpacerHeight(20),
              socialButtons(),
              SpacerHeight(25),
              signUpText(),
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

  Widget loginText() {
    return Text(
      'Login',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget emailAndPassFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailIdField(),
            SpacerHeight(20),
            passwordField(),
            SpacerHeight(20),
          ],
        ),
      ),
    );
  }

  Widget emailIdField() {
    return TextFormField(
      cursorColor: CustomColor.kPinkColor,
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
        // border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // borderSide: BorderSide(
          //     color: Colors.transparent,style: BorderStyle.none
          // ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // borderSide: BorderSide(
          //     color: Colors.transparent,style: BorderStyle.none
          // ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // borderSide: BorderSide(
          //     color: Colors.transparent
          // ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // borderSide: BorderSide(
          //     color: Colors.transparent
          // ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      cursorColor: CustomColor.kPinkColor,
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
          // borderSide: BorderSide(
          //     color: Colors.transparent
          // ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // borderSide: BorderSide(
          //     color: Colors.transparent
          // ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // borderSide: BorderSide(
          //     color: Colors.transparent
          // ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          if(formKey.currentState!.validate()){
            print(
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
            color: CustomColor.kPinkColor,
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

  Widget signUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Haven\'t Account.',
          style: TextStyle(fontSize: 16),
        ),
        SpacerWidth(3),
        GestureDetector(
          onTap: () => Get.off(() => SignUpPage()),
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: CustomColor.kPinkColor,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
