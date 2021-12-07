import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:get/get.dart';

import 'cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  final cartScreenController = Get.put(CartScreenController());
  @override
  Widget build(BuildContext context) {
    cartScreenController.getUserDetailsFromPrefs();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Obx(
        () => cartScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SpacerHeight(10),
                    ItemCountAndCost(),
                    const SpacerHeight(10),
                    CartItemListModule(),
                    const SpacerHeight(20),
                    ProceedButton(),
                    const SpacerHeight(10),
                  ],
                ),
              ),
      ),
    );
  }

}
