import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/pages/index_page/index_page.dart';
import 'package:get/get.dart';

class OrderConfirmedPage extends StatelessWidget {
  const OrderConfirmedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                congratulationText(),
                SpacerHeight(10),
                successText(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Container(
                    child: Image(
                      image: AssetImage(ImgUrl.orderConfirm),
                    ),
                  ),
                ),

                orderPlacedText(),
                SpacerHeight(10),

                reachOrderText(),
                SpacerHeight(10),

                backToHomeButton(),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget congratulationText() {
    return Text(
      'Congratulations',
      style: TextStyle(
        color: Colors.green,
        fontSize: Get.width * 0.08,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget successText() {
    return Text(
      'Payment Success',
      style: TextStyle(
        color: Colors.black,
        fontSize: Get.width * 0.05,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget orderPlacedText() {
    return Text(
      'Your Order has been placed.',
      style: TextStyle(
          fontSize: Get.width * 0.045
      ),
    );
  }

  Widget reachOrderText() {
    return Text(
      'We\'ll reach out to shortly with you order',
      style: TextStyle(
          fontSize: Get.width * 0.045
      ),
    );
  }

  Widget backToHomeButton() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          print('Clk');
          Get.offAll(()=> IndexPage());
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: CustomColor.kPinkColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'Back To Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
