import 'package:flutter/material.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/pages/index_page/index_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_model.dart';

class OnBoardingController extends GetxController {

  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  forwardAction() {
    if(isLastPage){
      setOnBoardingValue();
      Get.off(() => IndexPage());
    } else {
      pageController.nextPage(duration: 1.seconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
      img: ImgUrl.service1,
      title: 'Fast Delivery',
      description: 'Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery',
    ),
    OnBoardingInfo(
      img: ImgUrl.service2,
      title: 'Secure Payment',
      description: 'Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery',
    ),
    OnBoardingInfo(
      img: ImgUrl.service3,
      title: 'Enjoy Shopping!',
      description: 'Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery',
    ),
  ];

  setOnBoardingValue() async {
    print('Call Set Value Method');
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    print('Set Value : ${prefs.getBool("onboarding")}');
  }
}