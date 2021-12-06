import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetailScreenController extends GetxController {
  RxInt activeIndex = 0.obs;
  RxBool isFav = false.obs;
  RxInt productCount = 1.obs;
}