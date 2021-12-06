import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_drawer.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:general_store/screens/cart_screen/cart_screen.dart';
import 'package:get/get.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 0,
          title: Image(image: AssetImage(ImgUrl.logo)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  print('Cart Button');
                  Get.to(()=> CartScreen());
                },
                child: Icon(
                  Icons.shopping_bag,
                  color: AppColor.kPinkColor,
                ),
              ),
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: Obx(
          ()=> homeScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
          : SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SearchBar(),
                const SpacerHeight(15),
                CategoryListModule(),
                const SpacerHeight(15),
                BannerModule(),
                const SpacerHeight(5),
                BannerIndicator(),
                const SpacerHeight(15),
                TopCategory(),
                const SpacerHeight(15),
                Popular(),
                const SpacerHeight(10),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
