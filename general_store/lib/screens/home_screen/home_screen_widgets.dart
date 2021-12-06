import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:general_store/common/api_url.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:general_store/screens/category_screen/category_screen.dart';
import 'package:general_store/screens/collection_screen/collection_screen.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Container(
        height: 45,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            cursorColor: AppColor.kPinkColor,
            controller: homeScreenController.searchFieldController,
            onChanged: (value){
              homeScreenController.searchValue = value;
              print(homeScreenController.searchValue);
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
                  print('Search Text : ${homeScreenController.searchFieldController.text.trim()}');
                  homeScreenController.searchFieldController.clear();
                },
                child: Icon(
                  Icons.search_rounded,
                  color: AppColor.kPinkColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryListModule extends StatelessWidget {
  CategoryListModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.categoryLists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                print(
                    'Clicked : ${homeScreenController.categoryLists[index].catName}');
                Get.to(() => CollectionScreen());
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
                            image: AssetImage(
                                homeScreenController.categoryLists[index].img),
                          )),
                      // child: Image(
                      //   image: AssetImage(categoryLists[index].img),
                      //   // fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  const SpacerHeight(5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      homeScreenController.categoryLists[index].catName,
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
}

class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: homeScreenController.bannerLists.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = ApiUrl.ApiMainPath +
            "${homeScreenController.bannerLists[index].imagePath}";
        return _buildImage(imgUrl);
      },
      options: CarouselOptions(
          height: 160,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            homeScreenController.activeIndex.value = index;
          }),
    );
  }

  _buildImage(String urlImage) {
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
                    image: NetworkImage('$urlImage'),
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

}

class BannerIndicator extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homeScreenController.bannerLists.length,
          (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: homeScreenController.activeIndex.value == index
                  ? AppColor.kPinkColor
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class TopCategory extends StatelessWidget {
  TopCategory({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
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
            itemCount: homeScreenController.topCategoryLists.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                child: GestureDetector(
                  onTap: () {
                    print(index);
                    Get.to(()=> CategoryScreen());
                  },
                  child: Container(
                    height: 110, width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage(homeScreenController.topCategoryLists[index]),
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
}

class Popular extends StatelessWidget {
  Popular({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
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
              itemCount: homeScreenController.popularLists.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    print(homeScreenController.popularLists[index].name);
                    Get.to(() => CollectionScreen());
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(homeScreenController.popularLists[index].img),
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
                                homeScreenController.popularLists[index].name,
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
