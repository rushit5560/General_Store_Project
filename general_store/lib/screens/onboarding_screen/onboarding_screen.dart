import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/onboarding_screen_controller/onboarding_screen_controller.dart';
import 'package:general_store/models/onboarding_screen_model/onboarding_model.dart';
import 'package:get/get.dart';

import 'onboarding_screen_widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  // const OnBoardingPage({Key? key}) : super(key: key);
  OnBoardingScreenController onBoardingScreenController = Get.put(OnBoardingScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,

      body: Stack(
        children: [
          // Import From Custom Widgets
          BackGroundImage(),
          PageView.builder(
            controller: onBoardingScreenController.pageController,
            onPageChanged: onBoardingScreenController.selectedPageIndex,
            itemCount: onBoardingScreenController.onBoardingPages.length,
            itemBuilder: (context, index) {
              OnBoardingInfo onBoardingItem = onBoardingScreenController.onBoardingPages[index];
              return PageViewBuilderTile(onBoardingItem: onBoardingItem);
            },
          ),

          // Indicators
          Positioned(
            bottom: 25,
            left: 20,
            child: PageIndicators(),
          ),

          // Next Button
          Positioned(
            right: 20,
            bottom: 25,
            child: NextButton(),
          ),
        ],
      ),
    );
  }
}
