import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_drawer.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/pages/cart_page/cart_page.dart';
import 'package:general_store/pages/category_page/category_page.dart';
import 'package:general_store/pages/collection_page/collection_page.dart';
import 'package:get/get.dart';

import 'category_model.dart';
import 'popular_model.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  String? searchValue;

  List<CategoryInfo> categoryLists = [
    CategoryInfo(img: ImgUrl.cat1, catName: 'Pen'),
    CategoryInfo(img: ImgUrl.cat2, catName: 'Colors'),
    CategoryInfo(img: ImgUrl.cat3, catName: 'Clipboard'),
    CategoryInfo(img: ImgUrl.cat4, catName: 'Paper Clip'),
    CategoryInfo(img: ImgUrl.cat5, catName: 'Books'),
    CategoryInfo(img: ImgUrl.cat6, catName: 'Pages'),
    CategoryInfo(img: ImgUrl.cat1, catName: 'Pen'),
    CategoryInfo(img: ImgUrl.cat2, catName: 'Colors'),
    CategoryInfo(img: ImgUrl.cat3, catName: 'Clipboard'),
    CategoryInfo(img: ImgUrl.cat4, catName: 'Paper Clip'),
    CategoryInfo(img: ImgUrl.cat5, catName: 'Books'),
    CategoryInfo(img: ImgUrl.cat6, catName: 'Pages'),
  ];

  List topCategoryLists = [
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3
  ];

  List<PopularInfo> popularLists = [
    PopularInfo(img: ImgUrl.popular1, name: 'Popular 1 Pen'),
    PopularInfo(img: ImgUrl.popular2, name: 'Popular 2 Books'),
    PopularInfo(img: ImgUrl.popular3, name: 'Popular 3 Papers'),
    PopularInfo(img: ImgUrl.popular4, name: 'Popular 4 Pencils'),
  ];

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
                  Get.to(()=> CartPage());
                },
                child: Icon(
                  Icons.shopping_bag,
                  color: CustomColor.kPinkColor,
                ),
              ),
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              searchBar(),
              SpacerHeight(15),
              categoryList(),
              SpacerHeight(15),
              banner(),
              SpacerHeight(15),
              topCategory(),
              SpacerHeight(15),
              popular(),
              SpacerHeight(10),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Container(
        height: 45,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            cursorColor: CustomColor.kPinkColor,
            controller: searchController,
            onChanged: (value){
              searchValue = value;
              print(searchValue);
            },
            decoration: InputDecoration(
              hintText: 'Search Here',
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  print('Search Text : ${searchController.text.trim()}');
                  searchController.clear();
                },
                child: Icon(
                  Icons.search_rounded,
                  color: CustomColor.kPinkColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryList() {
    return Container(
      height: 95,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoryLists.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                print('Clicked : ${categoryLists[index].catName}');
                Get.to(()=> CollectionPage());
              },
              child: Column(
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 70, width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(categoryLists[index].img),
                        )
                      ),
                      // child: Image(
                      //   image: AssetImage(categoryLists[index].img),
                      //   // fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  SpacerHeight(5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                        categoryLists[index].catName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget banner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: Get.width,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(ImgUrl.slider),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: Get.width * 0.45,
            child: Text(
                'New Arrival 20% Off',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget topCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Top Category',
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16
            ),
          ),
        ),
        SpacerHeight(5),
        Container(
          height: 120,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: topCategoryLists.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                child: GestureDetector(
                  onTap: () {
                    print(index);
                    Get.to(()=> CategoryPage());
                  },
                  child: Container(
                    height: 110, width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage(topCategoryLists[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget popular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Popular',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16
            ),
          ),
        ),
        SpacerHeight(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: popularLists.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    print(popularLists[index].name);
                    Get.to(() => CollectionPage());
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(popularLists[index].img),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),

                        Positioned(
                          bottom: 20,
                          child: Container(
                            width: Get.width * 0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              child: Text(
                                  popularLists[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
