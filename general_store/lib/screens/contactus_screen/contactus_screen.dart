import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/contactus_screen_controller/contactus_screen_controller.dart';
import 'package:get/get.dart';

import 'contactus_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  final contactUsScreenController = Get.put(ContactUsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Contact Us'),
      body: Obx(
        () => contactUsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SpacerHeight(20),
                    FormFieldsModule(),
                    const SpacerHeight(25),
                    SubmitButton(),
                  ],
                ),
              ),
      ),
    );
  }

}
