import 'package:flutter/material.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/field_validation.dart';
import 'package:general_store/controllers/contactus_screen_controller/contactus_screen_controller.dart';
import 'package:get/get.dart';

class FormFieldsModule extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contactUsScreenController.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            FullNameField(),
            const SpacerHeight(12),
            EmailIdController(),
            const SpacerHeight(12),
            PhoneNoController(),
            const SpacerHeight(12),
            SubjectController(),
            const SpacerHeight(12),
            CommentController(),
          ],
        ),
      ),
    );
  }
}

class FullNameField extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.fullNameController,
      validator: (value) => FieldValidator().validateFullName(value!),
      cursorColor: Colors.black,
      decoration: contactUsFormDecoration('Full Name', 30),
    );
  }
}

class EmailIdController extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.emailIdController,
      validator: (value) => FieldValidator().validateEmail(value!),
      cursorColor: Colors.black,
      decoration: contactUsFormDecoration('Email Id', 30),
    );
  }
}

class PhoneNoController extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.phoneNoController,
      validator: (value) => FieldValidator().validateMobile(value!),
      cursorColor: Colors.black,
      maxLength: 10,
      decoration: contactUsFormDecoration('Phone No', 30),
    );
  }
}

class SubjectController extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.subjectController,
      validator: (value) => FieldValidator().validateSubject(value!),
      cursorColor: Colors.black,
      decoration: contactUsFormDecoration('Subject', 30),
    );
  }
}

class CommentController extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.commentController,
      validator: (value) => FieldValidator().validateComment(value!),
      cursorColor: Colors.black,
      maxLines: 3,
      decoration: contactUsFormDecoration('Comment', 10),
    );
  }
}


class SubmitButton extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GestureDetector(
        onTap: () => _submitButtonOnTap(),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColor.kPinkColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _submitButtonOnTap() {
    if(contactUsScreenController.formKey.currentState!.validate()){
      contactUsScreenController.getContactUsData(
        "${contactUsScreenController.fullNameController.text.trim()}",
        "${contactUsScreenController.emailIdController.text.trim().toLowerCase()}",
        "${contactUsScreenController.phoneNoController.text.trim()}",
        "${contactUsScreenController.subjectController.text.trim()}",
        "${contactUsScreenController.commentController.text.trim()}",
      );
      _clearTextFields();

    }
  }

  _clearTextFields() {
    contactUsScreenController.fullNameController.clear();
    contactUsScreenController.emailIdController.clear();
    contactUsScreenController.phoneNoController.clear();
    contactUsScreenController.subjectController.clear();
    contactUsScreenController.commentController.clear();
  }
}
