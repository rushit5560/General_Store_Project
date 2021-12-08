import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/category_collection_screen_controller/category_collection_screen_controller.dart';
import 'package:get/get.dart';
import 'category_collection_screen_widgets.dart';

class CategoryCollectionScreen extends StatelessWidget {
  CategoryCollectionScreen({Key? key}) : super(key: key);
  final categoryCollectionScreenController = Get.put(CategoryCollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Categories Name'),

      body: Obx(
            () => categoryCollectionScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : CategoryCollectionListModule(),
      ),
    );
  }
}
