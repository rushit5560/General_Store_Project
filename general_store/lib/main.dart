import 'package:flutter/material.dart';
// import 'package:general_store/pages/cart_page/cart_page.dart';
import 'package:general_store/pages/notification_page/notification_page.dart';
// import 'package:general_store/pages/splash_page/splash_page.dart';
import 'package:get/get.dart';

import 'common/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'General Store',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: NotificationPage(),
    );
  }
}
