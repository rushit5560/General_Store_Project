import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:get/get.dart';

import 'category_screen_widgets.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Obx(()=>
          categoryScreenController.isLoading.value
          ? CustomCircularProgressIndicator()
          : CategoryListModule()),


    );
  }
}
