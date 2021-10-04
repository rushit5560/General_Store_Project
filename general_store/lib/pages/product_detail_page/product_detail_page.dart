import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/img_url.dart';
import 'package:get/get.dart';
import 'product_detail_controller.dart';

class ProductDetailPage extends StatelessWidget {
  // const ProductDetailPage({Key? key}) : super(key: key);

  ProductDetailController productDetailController =
      Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                carouselSlider(),
                carouselIndicator(),
                // Positioned(
                //   bottom: -18,
                //   right: 10,
                //   child: favButton(),
                // ),
              ],
            ),

            Transform(
              transform: Matrix4.translationValues(-5, -Get.height * 0.03, 0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        favButton()
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = '${ImgUrl.popular1}';
        return buildImage(imgUrl, index);
      },
      options: CarouselOptions(
          height: Get.height * 0.30,
          autoPlay: true,
          // autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            productDetailController.activeIndex.value = index;
          }),
    );
  }

  // Carousel Image Builder
  Widget buildImage(String urlImage, int index) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                image: AssetImage('${ImgUrl.popular1}'), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }

  Widget carouselIndicator() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: productDetailController.activeIndex.value == index
                  ? CustomColor.kPinkColor
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget favButton() {
    return Obx(
      () => GestureDetector(
        onTap: () {
          productDetailController.isFav.value =
              !productDetailController.isFav.value;
          print('isFav ::: ${productDetailController.isFav.value}');
        },
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(35),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: productDetailController.isFav.value
                  ? Icon(
                      Icons.favorite_rounded,
                      color: CustomColor.kPinkColor,
                    )
                  : Icon(
                      Icons.favorite_border_rounded,
                      color: CustomColor.kPinkColor,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
