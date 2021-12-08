import 'package:flutter/material.dart';
import 'package:general_store/common/api_url.dart';
import 'package:general_store/controllers/category_collection_screen_controller/category_collection_screen_controller.dart';
import 'package:general_store/models/category_collection_screen_model/category_collection_model.dart';
import 'package:general_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:get/get.dart';

class CategoryCollectionListModule extends StatelessWidget {
  CategoryCollectionListModule({Key? key}) : super(key: key);
  final categoryCollectionScreenController = Get.find<CategoryCollectionScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: categoryCollectionScreenController.categoryCollectionLists.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, i){
        Datum collectionSingleItem =
        categoryCollectionScreenController.categoryCollectionLists[i];
        return collectionListTile(collectionSingleItem);
      },
    );
  }

  Widget collectionListTile(Datum collectionSingleItem) {
    String imgUrl = ApiUrl.ApiMainPath + collectionSingleItem.showimg;
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(),
            arguments: collectionSingleItem.id);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage("$imgUrl"), fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 15,
            child: Container(
              width: Get.width * 0.38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 3, bottom: 3),
                child: Text(
                  collectionSingleItem.productname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
