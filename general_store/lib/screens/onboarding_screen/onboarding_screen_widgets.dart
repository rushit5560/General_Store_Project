import 'package:flutter/material.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/onboarding_screen_controller/onboarding_screen_controller.dart';
import 'package:general_store/models/onboarding_screen_model/onboarding_model.dart';
import 'package:get/get.dart';

class PageIndicators extends StatelessWidget {
  PageIndicators({Key? key}) : super(key: key);
  final onBoardingScreenController = Get.find<OnBoardingScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        onBoardingScreenController.onBoardingPages.length,
        (index) => Obx(
          () => onBoardingScreenController.selectedPageIndex.value == index
              ? activeIndicator()
              : inActiveIndicator(),
        ),
      ),
    );
  }

  Widget activeIndicator() {
    return Container(
      margin: EdgeInsets.all(4),
      width: 24,
      height: 12,
      decoration: BoxDecoration(
          color: AppColor.kPinkColor,
          borderRadius: BorderRadius.circular(15)),
    );
  }

  Widget inActiveIndicator() {
    return Container(
      margin: EdgeInsets.all(4),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
          color: Colors.black, shape: BoxShape.circle),
    );
  }
}

class NextButton extends StatelessWidget {
  NextButton({Key? key}) : super(key: key);
  final onBoardingScreenController = Get.find<OnBoardingScreenController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: AppColor.kPinkColor,
      onPressed: onBoardingScreenController.forwardAction,
      child: Obx(
            () => Text(
          onBoardingScreenController.isLastPage ? 'Start' : 'Next',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PageViewBuilderTile extends StatelessWidget {
  OnBoardingInfo onBoardingItem;
  PageViewBuilderTile({required this.onBoardingItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(140),
              child: Container(
                width: Get.width * 0.5,
                height: Get.width * 0.5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(onBoardingItem.img),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            SpacerHeight(30),
            Text(
              onBoardingItem.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SpacerHeight(15),
            Text(
              onBoardingItem.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SpacerHeight(10),
          ],
        ),
      ),
    );
  }
}
