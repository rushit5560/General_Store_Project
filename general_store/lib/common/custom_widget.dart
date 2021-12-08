import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_color.dart';
import 'img_url.dart';

class SpacerHeight extends StatelessWidget {
  final double value;
  const SpacerHeight(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}

class SpacerWidth extends StatelessWidget {
  final double value;
  const SpacerWidth(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider();
  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1);
  }
}

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImgUrl.servicebg),
              fit: BoxFit.cover
          ),
        )
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(ImgUrl.logo),
      width: Get.width * 0.6,
    );
  }
}

class LoginAndSignUpText extends StatelessWidget {
  final text;
  LoginAndSignUpText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}

InputDecoration formInputDecoration(String hintText) {
  return InputDecoration(
    hintText: '$hintText',
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
  );
}

class OrLine extends StatelessWidget {
  const OrLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class CustomCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColor.kPinkColor,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

InputDecoration contactUsFormDecoration(String hintText, double radius) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    hintText: '$hintText',
    counterText: '',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}