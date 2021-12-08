import 'package:flutter/material.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/field_validation.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:general_store/models/profile_screen_model/city_model.dart';
import 'package:general_store/models/profile_screen_model/country_model.dart';
import 'package:general_store/models/profile_screen_model/state_model.dart';
import 'package:get/get.dart';

class BannerAndUserNameModule extends StatelessWidget {
  BannerAndUserNameModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.22,
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
}

class UserProfileDetails extends StatelessWidget {
  UserProfileDetails({Key? key}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          _profilePictureModule(),
          const SpacerHeight(15),

          // UserName
          _userNameModule(),
          const CustomDivider(),

          // Address
          _addressModule(),
          const CustomDivider(),

          // Phone No.
          phoneNoModule(),
          const CustomDivider(),

          // Email
          emailModule(),
          const CustomDivider(),

          // Password
          passwordModule(),
          const CustomDivider(),
          const SpacerHeight(20),

          EditProfileButton(),
          const SpacerHeight(10),
        ],
      ),
    );
  }

  Widget _profilePictureModule() {
    return Container(
      height: Get.width * 0.35,
      width: Get.width * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImgUrl.profile)),
      ),
    );
  }

  Widget _userNameModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.person_rounded,
              color: AppColor.kPinkColor,
            ),
          ),
          const SpacerWidth(10),
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
    );
  }

  Widget _addressModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.location_on_rounded,
              color: AppColor.kPinkColor,
            ),
          ),
          const SpacerWidth(10),
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
    );
  }

  Widget phoneNoModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.phone_iphone_rounded,
              color: AppColor.kPinkColor,
            ),
          ),
          const SpacerWidth(10),
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
    );
  }

  Widget emailModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.email_rounded,
              color: AppColor.kPinkColor,
            ),
          ),
          const SpacerWidth(10),
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
    );
  }

  Widget passwordModule() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.lock_rounded,
                color: AppColor.kPinkColor,
              ),
            ),
            const SpacerWidth(10),
            Expanded(
              child: Container(
                child: Text(
                  profileScreenController.isVisible.value
                      ? '${profileScreenController.password}'
                      : '${profileScreenController.password.replaceAll(RegExp(r"."), "*")}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SpacerWidth(10),
            GestureDetector(
              onTap: () {
                profileScreenController.isVisible.value =
                    !profileScreenController.isVisible.value;
              },
              child: Container(
                child: Icon(
                  profileScreenController.isVisible.value
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: AppColor.kPinkColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileButton extends StatelessWidget {
  EditProfileButton({Key? key}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openEditProfileModule(),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.kPinkColor,
          borderRadius: BorderRadius.circular(25),
        ),
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
          ),
        ),
      ),
    );
  }

  openEditProfileModule() {
    return Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: profileScreenController.formKey,
              child: Obx(
                () => profileScreenController.isLoading.value
                    ? CustomCircularProgressIndicator()
                    : Column(
                        children: [
                          const SpacerHeight(10),
                          _editProfileHeaderText(),
                          const SpacerHeight(10),
                          _fullNameModule(),
                          const SpacerHeight(10),
                          CountryDropDownModule(),
                          const SpacerHeight(10),
                          StateDropDownModule(),
                          const SpacerHeight(10),
                          CityDropDownModule(),
                          const SpacerHeight(15),
                          _updateButton(),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _editProfileHeaderText() {
    return Column(
      children: [
        Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Divider(
          color: AppColor.kPinkColor,
          thickness: 1,
        ),
      ],
    );
  }

  Widget _fullNameModule() {
    return TextFormField(
      controller: profileScreenController.fullNameController,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: formInputDecoration('UserName'),
    );
  }

  Widget _updateButton() {
    return GestureDetector(
      onTap: () {
        if (profileScreenController.formKey.currentState!.validate()) {
          profileScreenController.updateProfileData(
              "${profileScreenController.fullNameController.text.trim()}");
        }
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColor.kPinkColor,
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
          ),
        ),
      ),
    );
  }
}

class CountryDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<Datum>(
          value: profileScreenController.countryDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.countryDropDownValue!.name = newValue!.name;
            profileScreenController.countryDropDownValue!.id = newValue.id;
            print(
                "countryDropDownValue : ${profileScreenController.countryDropDownValue!.name}");
            print("countryDropDownValue ID : ${newValue.id}");
            profileScreenController.getStateData(newValue.id);
          },
          items: profileScreenController.countryLists
              .map<DropdownMenuItem<Datum>>((Datum value) {
            return DropdownMenuItem<Datum>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class StateDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumState>(
          value: profileScreenController.stateDropDownValue,
          icon:
              const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.stateDropDownValue!.name = newValue!.name;
            profileScreenController.stateDropDownValue!.id = newValue.id;
            print(
                "stateDropDownValue : ${profileScreenController.stateDropDownValue}");
            print('newValue.name : ${newValue.name}');
            profileScreenController.getCityData(newValue.id);
            profileScreenController.loading();
          },
          items: profileScreenController.stateLists
              .map<DropdownMenuItem<DatumState>>((DatumState value) {
            return DropdownMenuItem<DatumState>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class CityDropDownModule extends StatelessWidget {
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumCity>(
          value: profileScreenController.cityDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            profileScreenController.cityDropDownValue!.name = newValue!.name;
            profileScreenController.cityDropDownValue!.id = newValue.id;
            print(
                "cityDropDownValue : ${profileScreenController.cityDropDownValue}");
            print('newValue.name : ${newValue.name}');
            profileScreenController.loading();
          },
          items: profileScreenController.cityLists
              .map<DropdownMenuItem<DatumCity>>((DatumCity value) {
            return DropdownMenuItem<DatumCity>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
