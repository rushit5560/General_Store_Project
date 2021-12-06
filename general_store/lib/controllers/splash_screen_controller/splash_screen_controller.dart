import 'dart:async';
import 'package:general_store/screens/index_screen/index_screen.dart';
import 'package:general_store/screens/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  bool? onBoardingValue = false;

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), getOnBoardingValue);

  }

  getOnBoardingValue() async {
    print('-----getOnBoardingValue Function Run-----');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardingValue = prefs.getBool("onboarding");
    print('Value : $onBoardingValue');
    if (onBoardingValue == true) {
      print('----Go to IndexPage----');
      Get.off(() => IndexScreen());
    } else {
      print('----Go to OnBoardingPage----');
      Get.off(() => OnBoardingScreen());
    }
  }
}
