import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Image Slider
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      carouselSlider(),
                      carouselIndicator(),
                    ],
                  ),

                  Transform(
                    transform: Matrix4.translationValues(0, -Get.height * 0.03, 0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [

                                  // Favorite Button
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      favButton()
                                    ],
                                  ),
                                  // SpacerHeight(10),

                                  // Product Detail
                                  Container(
                                    child: Text(
                                      'Product title Product title Product title Product title Product title Product title Product title',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                      ),
                                    ),
                                  ),
                                  SpacerHeight(8),

                                  // Product Price & Ratings
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                '\$20.00',
                                                style: TextStyle(
                                                    color: CustomColor.kPinkColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16
                                                ),
                                              ),
                                              SpacerWidth(5),
                                              Text(
                                                '\$20.00',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    decoration: TextDecoration.lineThrough
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: CustomColor.kOrangeColor,
                                              ),
                                              SpacerWidth(5),
                                              Text('4.5')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SpacerHeight(8),

                                  // Product Qty Inc Or Dec
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        GestureDetector(
                                          onTap: () {
                                            print('Dec');
                                            if(productDetailController.productCount.value > 1){
                                              productDetailController.productCount.value =
                                                  productDetailController.productCount.value - 1;
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(right: BorderSide(color: Colors.grey)),
                                            ),
                                            child: Icon(Icons.remove),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 7),
                                          child: Obx(
                                                ()=> Text(
                                              '${productDetailController.productCount.value}',
                                              style: TextStyle(
                                                  fontSize: 16
                                              ),
                                            ),
                                          ),
                                        ),

                                        GestureDetector(
                                          onTap: () {
                                            print('Inc');
                                            if(productDetailController.productCount.value < 9){
                                              productDetailController.productCount.value =
                                                  productDetailController.productCount.value + 1;
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(left: BorderSide(color: Colors.grey)),
                                            ),
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SpacerHeight(15),

                                  // TabBar Product Review & Detail
                                  DefaultTabController(
                                    length: 2,
                                    child: Column(
                                      children: [
                                        TabBar(
                                          labelColor: CustomColor.kPinkColor,
                                          unselectedLabelColor: Colors.black,
                                          indicatorSize: TabBarIndicatorSize.label,
                                          indicatorColor: CustomColor.kPinkColor,
                                          tabs: [
                                            Tab(text: 'Details'),
                                            Tab(text: 'Review'),
                                          ],
                                        ),

                                        Container(
                                          height: Get.height * 0.17,
                                          child: TabBarView(
                                            physics: NeverScrollableScrollPhysics(),
                                            children: [
                                              //Product Detail Text Part
                                              Text('Product Details Product Details Product Details'),
                                              // Product Review Part
                                              Text('Review Review Review'),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  // SpacerHeight(15),

                                ],
                              ),
                            ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            // BuyNow & AddToCart Button
            buyAndCartButton(),

          ],
        ),
      ),


      // bottomNavigationBar: bottomNavigation(),
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: (){
              print('Click On Buy Now Button');
            },
            child: Container(
              width: Get.width * 0.30,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: CustomColor.kPinkColor,
              ),
              child: Center(
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),

        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: (){
              print('Click On Add To Cart Button');
            },
            child: Container(
              width: Get.width * 0.30,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: CustomColor.kPinkColor,
              ),
              child: Center(
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  // BuyNow & AddToCart Button
  Widget buyAndCartButton() {
    return Container(
      child: Column(
        children: [
          SpacerHeight(15),
          Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 10,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    GestureDetector(
                      onTap: (){
                        print('Click On Buy Now Button');
                      },
                      child: Container(
                        width: Get.width * 0.30,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: CustomColor.kPinkColor,
                        ),
                        child: Center(
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        print('Click On Add To Cart Button');
                      },
                      child: Container(
                        width: Get.width * 0.30,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: CustomColor.kPinkColor,
                        ),
                        child: Center(
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
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
