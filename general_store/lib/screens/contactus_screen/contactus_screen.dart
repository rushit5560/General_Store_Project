import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatelessWidget {
  // const ContactUsPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Contact Us',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            SpacerHeight(20),
            formFields(),
            SpacerHeight(25),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget formFields() {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            fullNameField(),
            SpacerHeight(12),
            emailIdField(),
            SpacerHeight(12),
            subjectField(),
            SpacerHeight(12),
            commentField(),
          ],
        ),
      ),
    );
  }

  Widget fullNameField() {
    return TextFormField(
      controller: fullNameController,
      validator: (value){
        if(value!.isEmpty){
          return 'Full Name Not Empty!';
        }
      },
      cursorColor: CustomColor.kPinkColor,
      decoration: InputDecoration(
        hintText: 'Full Name',
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
    );
  }

  Widget emailIdField() {
    return TextFormField(
      controller: emailIdController,
      validator: (value){
        if(value!.isEmpty){
          return 'Email Id Not Empty!';
        }
        else if(!value.contains('@')){
          return 'Email should be valid!';
        }
      },
      cursorColor: CustomColor.kPinkColor,
      decoration: InputDecoration(
          hintText: 'Email Id',
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
    );
  }

  Widget subjectField() {
    return TextFormField(
      controller: subjectController,
      validator: (value){
        if(value!.isEmpty){
          return 'Subject Not Empty!';
        }
      },
      cursorColor: CustomColor.kPinkColor,
      decoration: InputDecoration(
          hintText: 'Subject',
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
    );
  }

  Widget commentField() {
    return TextFormField(
      controller: commentController,
      validator: (value){
        if(value!.isEmpty){
          return 'Comment Not Empty!';
        }
      },
      maxLines: 3,
      cursorColor: CustomColor.kPinkColor,
      decoration: InputDecoration(
          hintText: 'Comment',
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GestureDetector(
        onTap: () => submitButtonOnTap(),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: CustomColor.kPinkColor,
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

  submitButtonOnTap() {
    if(formKey.currentState!.validate()){
      print(
        'Full Name : ${fullNameController.text.trim()}'
            '\nEmail Id : ${emailIdController.text.trim()}'
            '\nSubject : ${subjectController.text.trim()}'
            '\nComment : ${commentController.text.trim()}'
      );
    }
  }

}
