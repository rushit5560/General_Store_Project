import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/collection_screen_controller/collection_screen_controller.dart';
import 'package:get/get.dart';
import 'collection_screen_widgets.dart';

class CollectionScreen extends StatelessWidget {
  // const CollectionPage({Key? key}) : super(key: key);
  final collectionScreenController = Get.put(CollectionScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Collections'),

      body: Obx(
        () => collectionScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CollectionListModule(),
              ),
      ),
    );
  }
}
