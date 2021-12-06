import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/controllers/onboarding_screen_controller/onboarding_screen_controller.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  // const OnBoardingPage({Key? key}) : super(key: key);
  OnBoardingScreenController onBoardingScreenController = Get.put(OnBoardingScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,

      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImgUrl.servicebg),
                    fit: BoxFit.cover
                ),
              )
          ),
          PageView.builder(
            controller: onBoardingScreenController.pageController,
            onPageChanged: onBoardingScreenController.selectedPageIndex,
            itemCount: onBoardingScreenController.onBoardingPages.length,
            itemBuilder: (context, index) {
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
                              image: AssetImage(onBoardingScreenController.onBoardingPages[index].img),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                      SpacerHeight(30),
                      Text(
                        onBoardingScreenController.onBoardingPages[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SpacerHeight(15),
                      Text(
                        onBoardingScreenController.onBoardingPages[index].description,
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
            },
          ),

          Positioned(
            bottom: 25,
            left: 20,
            child: Row(
              children: List.generate(
                onBoardingScreenController.onBoardingPages.length,
                    (index) => Obx(
                      () => onBoardingScreenController.selectedPageIndex.value == index ?
                          Container(
                            margin: EdgeInsets.all(4),
                            width: 24,
                            height: 12,
                            decoration: BoxDecoration(
                                color: CustomColor.kPinkColor,
                              borderRadius: BorderRadius.circular(15)
                                ),
                          )
                          : Container(
                        margin: EdgeInsets.all(4),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle),
                      ),
                ),
              ),
            ),
          ),

          Positioned(
            right: 20,
            bottom: 25,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: CustomColor.kPinkColor,
              onPressed: onBoardingScreenController.forwardAction,
              child: Obx(
                    () => Text(
                  onBoardingScreenController.isLastPage ? 'Start' : 'Next',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
