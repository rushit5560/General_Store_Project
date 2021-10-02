import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/pages/onboarding_page/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  // const OnBoardingPage({Key? key}) : super(key: key);
  OnBoardingController onBoardingController = Get.put(OnBoardingController());


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
            controller: onBoardingController.pageController,
            onPageChanged: onBoardingController.selectedPageIndex,
            itemCount: onBoardingController.onBoardingPages.length,
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
                              image: AssetImage(onBoardingController.onBoardingPages[index].img),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                      SpacerHeight(30),
                      Text(
                        onBoardingController.onBoardingPages[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SpacerHeight(15),
                      Text(
                        onBoardingController.onBoardingPages[index].description,
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
                onBoardingController.onBoardingPages.length,
                    (index) => Obx(
                      () => onBoardingController.selectedPageIndex.value == index ?
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
              onPressed: onBoardingController.forwardAction,
              child: Obx(
                    () => Text(
                  onBoardingController.isLastPage ? 'Start' : 'Next',
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
