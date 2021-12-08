import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:get/get.dart';
import '../../controllers/product_detail_screen_controller/product_detail_screen_controller.dart';
import 'product_detail_screen_widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  final productDetailScreenController = Get.put(ProductDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar('Product Details'),

      body: Obx(
        () => productDetailScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Image Slider
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                        children: [
                          ProductImageSliderModule(),
                          ProductImageSliderIndicator(),
                        ],
                      ),
                      ProductDetails(),
                    ],
                  ),
                ),
              ),
      ),
      bottomNavigationBar: Obx(() =>
          productDetailScreenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : BuyAndCartButtons()),
    );
  }

}