import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/app_theme.dart';
import 'pages/product_detail_page/product_detail_page.dart';

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
      home: ProductDetailPage(),
    );
  }
}
