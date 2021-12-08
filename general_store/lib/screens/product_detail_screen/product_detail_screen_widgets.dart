import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:general_store/common/api_url.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/product_detail_screen_controller/product_detail_screen_controller.dart';
import 'package:general_store/models/product_detail_screen_model/get_product_review_model.dart';
import 'package:get/get.dart';

class ProductImageSliderModule extends StatelessWidget {
  ProductImageSliderModule({Key? key}) : super(key: key);
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount:
          productDetailScreenController.productDetailLists[0].images.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = ApiUrl.ApiMainPath +
            '${productDetailScreenController.productDetailLists[0].images[index]}';
        return buildImage(imgUrl, index);
      },
      options: CarouselOptions(
          height: Get.height * 0.30,
          autoPlay: true,
          // autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            productDetailScreenController.activeIndex.value = index;
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
                image: NetworkImage('$urlImage'), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}

class ProductImageSliderIndicator extends StatelessWidget {
  ProductImageSliderIndicator({Key? key}) : super(key: key);
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          productDetailScreenController.productDetailLists[0].images.length,
          (index) => productDetailScreenController.activeIndex.value == index
              ? Container(
                  margin: EdgeInsets.all(4),
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    color: AppColor.kPinkColor,
                    shape: BoxShape.circle,
                  ),
                )
              : Container(
                  margin: EdgeInsets.all(4),
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.kPinkColor),
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, -Get.height * 0.03, 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
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
                  FavouriteButton(),

                  // Product Detail
                  ProductDescription(),
                  const SpacerHeight(8),

                  // Product Price & Ratings
                  ProductPriceAndRatings(),
                  const SpacerHeight(8),

                  // Product Qty Inc Or Dec
                  ProductQtyModule(),
                  const SpacerHeight(15),

                  // Product Review & Detail
                  ProductDetailsAndReview(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Use In ProductDetails Module
class FavouriteButton extends StatelessWidget {
  FavouriteButton({Key? key}) : super(key: key);
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            // productDetailScreenController.isFav.value =
            // !productDetailScreenController.isFav.value;
            // print('isFav ::: ${productDetailScreenController.isFav.value}');
          },
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(35),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    /*productDetailScreenController.isFav.value
                      ? Icon(
                    Icons.favorite_rounded,
                    color: AppColor.kPinkColor,
                  )
                      :*/
                    Icon(
                  Icons.favorite_border_rounded,
                  color: AppColor.kPinkColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Use In ProductDetails Module
class ProductDescription extends StatelessWidget {
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Text(
      '${productDetailScreenController.productDetailLists[0].productname}',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

// Use In ProductDetails Module
class ProductPriceAndRatings extends StatelessWidget {
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Text(
                '\$${productDetailScreenController.productDetailLists[0].productcost}',
                style: TextStyle(
                    color: AppColor.kPinkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SpacerWidth(5),
              Text(
                '\$${productDetailScreenController.productDetailLists[0].productcost}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: AppColor.kOrangeColor,
              ),
              SpacerWidth(5),
              Text('4.5')
            ],
          ),
        ),
      ],
    );
  }
}

// Use In ProductDetails Module
class ProductQtyModule extends StatelessWidget {
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (productDetailScreenController.productCount > 1) {
                productDetailScreenController.productCount.value =
                    productDetailScreenController.productCount.value - 1;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Icon(Icons.remove, size: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Obx(
              () => Text(
                '${productDetailScreenController.productCount}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (productDetailScreenController.productCount < 9) {
                productDetailScreenController.productCount.value =
                    productDetailScreenController.productCount.value + 1;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Icon(Icons.add, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}

// Use In ProductDetails Module
class ProductDetailsAndReview extends StatelessWidget {
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelColor: AppColor.kPinkColor,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColor.kPinkColor,
            isScrollable: true,
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Review'),
            ],
          ),
          Container(
            height: Get.height * 0.30,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                //Product Detail Text Part
                _productDetailText(),
                // Product Review Part
                _productReviewList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productDetailText() {
    return Text(
        '${productDetailScreenController.productDetailLists[0].fullText}');
  }

  Widget _productReviewList() {
    return ListView.builder(
      itemCount: productDetailScreenController.productReviewList.length,
      itemBuilder: (context, index) {
        Datum1 productSingleReview =
            productDetailScreenController.productReviewList[index];
        return _productReviewListTile(productSingleReview);
      },
    );
  }

  Widget _productReviewListTile(Datum1 productSingleReview) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${productSingleReview.username}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: RatingBar.builder(
                          itemCount: 5,
                          ignoreGestures: true,
                          unratedColor: AppColor.kLightOrangeColor,
                          allowHalfRating: true,
                          itemSize: 15,
                          minRating: 1,
                          glow: false,
                          initialRating: productSingleReview.ratings.toDouble(),
                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star_rounded,
                              color: AppColor.kOrangeColor,
                            );
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      productSingleReview.comment,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyAndCartButtons extends StatelessWidget {
  final productDetailScreenController =
      Get.find<ProductDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 2),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: Get.height * 0.06,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Click On Buy Now Button');
                    },
                    child: Container(
                      width: Get.width * 0.30,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColor.kPinkColor,
                      ),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      productDetailScreenController.productAddToCart();
                    },
                    child: Container(
                      width: Get.width * 0.30,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColor.kPinkColor,
                      ),
                      child: Center(
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
