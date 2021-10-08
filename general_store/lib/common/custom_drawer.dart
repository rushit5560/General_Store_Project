import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_store/pages/collection_page/collection_page.dart';
import 'package:general_store/pages/notification_page/notification_page.dart';
import 'package:general_store/pages/profile_page/profile_page.dart';
import 'package:general_store/pages/setting_page/setting_page.dart';
import 'package:general_store/pages/signin_page/signin_page.dart';
import 'package:get/get.dart';
import 'custom_color.dart';
import 'img_url.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        closeButton(),

                        SizedBox(height: 20),
                        profilePicAndName(),
                        SizedBox(height: 20),

                        homeButton(),
                        divider(),
                        profileButton(),
                        divider(),
                        collectionButton(),
                        divider(),
                        settingsButton(),
                        divider(),
                        notificationButton(),
                        divider(),
                        loginButton(),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                child: Column(
                  children: [
                    divider(),
                    logoutButton(),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget divider() {
    return Divider(color: Colors.black,
      indent: 15, endIndent: 15,height: 0,);
  }

  Widget closeButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(onTap: () {
            Get.back();
          },
              child: Icon(CupertinoIcons.clear,))
        ],
      ),
    );
  }

  Widget profilePicAndName() {
    return Container(
      child: Column(
        children: [
          Container(
            width: 95, height: 95,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(ImgUrl.profile),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Jenny Doe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
          ),
          // Text(
          //   'jennydoe@gmail.com',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
          // ),
        ],
      ),
    );
  }

  Widget homeButton() {
    return ListTile(
      onTap: () {
        Get.back();
        // Get.to(IndexPage());
      },
      leading: Icon(Icons.home_outlined,color: Colors.black,),
      title: Text('Home',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget profileButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => ProfilePage());
      },
      leading: Icon(Icons.person_outline_outlined,color: Colors.black,),
      title: Text('Profile',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget collectionButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => CollectionPage());
      },
      leading: Icon(Icons.storefront_outlined,color: Colors.black,),
      title: Text('Collection',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget settingsButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => SettingPage());
      },
      leading: Icon(Icons.settings_outlined,color: Colors.black,),
      title: Text('Settings',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget notificationButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(() => NotificationPage());
      },
      leading: Icon(Icons.notifications_on_outlined,color: Colors.black,),
      title: Text('Notification',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget logoutButton() {
    return Container(
      child: ListTile(
        onTap: () {
          Get.back();
          // Get.to(() => SignInPage());
        },
        leading: Icon(Icons.login_outlined,color: Colors.black,),
        title: Text('Logout',
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      child: ListTile(
        onTap: () {
          Get.back();
          Get.to(() => SignInPage());
        },
        leading: Icon(Icons.login_outlined,color: Colors.black,),
        title: Text('Login',
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
