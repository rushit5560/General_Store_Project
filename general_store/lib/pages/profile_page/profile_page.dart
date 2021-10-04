import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:get/get.dart';

import 'profile_page_controller.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({Key? key}) : super(key: key);

  ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  String password = 'password';

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            bannerAndUserName(),
            Transform(
              transform: Matrix4.translationValues(0, -Get.height * 0.085, 0),
              child: userDetails(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget bannerAndUserName() {
    return Container(
      height: Get.height * 0.22,
      // width: Get.width,
      child: Center(
        child: Text(
          'Jenny Doe',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImgUrl.slider), fit: BoxFit.cover),
      ),
    );
  }

  Widget userDetails(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          // Profile Picture
          Container(
            height: Get.width * 0.35,
            width: Get.width * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImgUrl.profile)),
            ),
          ),

          SpacerHeight(15),

          // UserName
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.person_rounded,
                    color: CustomColor.kPinkColor,
                  ),
                ),
                SpacerWidth(10),
                Expanded(
                  child: Container(
                    child: Text(
                      'Jenny Doe',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomDivider(),

          // Address
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.location_on_rounded,
                    color: CustomColor.kPinkColor,
                  ),
                ),
                SpacerWidth(10),
                Expanded(
                  child: Container(
                    child: Text(
                      '7000, WhiteField, manchester Highway, London, 401203',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomDivider(),

          // Phone No.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.phone_iphone_rounded,
                    color: CustomColor.kPinkColor,
                  ),
                ),
                SpacerWidth(10),
                Expanded(
                  child: Container(
                    child: Text(
                      '+91 1234569870',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomDivider(),

          // Email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.email_rounded,
                    color: CustomColor.kPinkColor,
                  ),
                ),
                SpacerWidth(10),
                Expanded(
                  child: Container(
                    child: Text(
                      'user@gmail.com',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomDivider(),

          // Password
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.lock_rounded,
                      color: CustomColor.kPinkColor,
                    ),
                  ),
                  const SpacerWidth(10),
                  Expanded(
                    child: Container(
                      child: Text(
                        profilePageController.isVisible.value
                            ? '$password'
                            : '${password.replaceAll(RegExp(r"."), "*")}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const SpacerWidth(10),
                  GestureDetector(
                    onTap: () {
                      profilePageController.isVisible.value =
                          !profilePageController.isVisible.value;
                    },
                    child: Container(
                      child: Icon(
                        profilePageController.isVisible.value
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: CustomColor.kPinkColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomDivider(),
          const SpacerHeight(20),

          editProfileButton(context),
          const SpacerHeight(10),
        ],
      ),
    );
  }

  Widget editProfileButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print('Edit Profile');
          openEditMenu(context);
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kPinkColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text(
              'Edit Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )),
        ),
      ),
    );
  }

  // BottomSheet
  openEditMenu(context) {
    return Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpacerHeight(10),
                editProfileText(),
                SpacerHeight(10),
                TextFormField(
                  controller: fullNameController,
                  keyboardType: TextInputType.text,
                  cursorColor: CustomColor.kPinkColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Full Name Can\'t be Empty";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SpacerHeight(10),
                TextFormField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  cursorColor: CustomColor.kPinkColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address Can\'t be Empty";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Address',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SpacerHeight(10),
                TextFormField(
                  controller: phoneNoController,
                  keyboardType: TextInputType.number,
                  cursorColor: CustomColor.kPinkColor,
                  maxLength: 10,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone No. Can\'t be Empty";
                    }
                    if (value.length != 10) {
                      return "Enter Valid Phone Number";
                    }
                  },
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Phone No.',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SpacerHeight(10),
                TextFormField(
                  controller: emailIdController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: CustomColor.kPinkColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email Id Can\'t be Empty";
                    }
                    if (!value.contains('@')) {
                      return "Enter Valid Email Id";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Email Id',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SpacerHeight(10),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  cursorColor: CustomColor.kPinkColor,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password Can\'t be Empty";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    /*suffixIcon: GestureDetector(
                            onTap: () {
                              profilePageController.isVisibleEditProfile.value =
                              !profilePageController.isVisibleEditProfile.value;
                            },
                            child: profilePageController.isVisibleEditProfile
                                .value
                                ? Icon(
                              Icons.visibility_rounded,
                              color: CustomColor.kPinkColor,
                            )
                                : Icon(
                              Icons.visibility_off_rounded,
                              color: Colors.grey,
                            ),
                          ),*/
                  ),
                ),
                SpacerHeight(20),
                updateButton(),
                SpacerHeight(20),
              ],
            ),
          ),
        ),
      ),
      isDismissible: true,
      enableDrag: false,
      // barrierColor: Colors.grey,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
    );
  }

  Widget editProfileText() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Divider(
          color: CustomColor.kPinkColor,
          thickness: 1,
        ),
      ],
    );
  }

  Widget updateButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            print('Update Profile');
            Get.back();
            fullNameController.clear();
            addressController.clear();
            phoneNoController.clear();
            emailIdController.clear();
            passwordController.clear();
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kPinkColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text(
              'Update',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )),
        ),
      ),
    );
  }
}
