import 'package:flutter/material.dart';
import 'package:general_store/common/api_url.dart';
import 'package:general_store/controllers/collection_screen_controller/collection_screen_controller.dart';
import 'package:general_store/models/collection_screen_model/collection_model.dart';
import 'package:general_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:get/get.dart';

class CollectionListModule extends StatelessWidget {
  CollectionListModule({Key? key}) : super(key: key);
  final collectionScreenController = Get.find<CollectionScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: collectionScreenController.collectionLists.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, i) {
        Datum1 collectionSingleItem =
            collectionScreenController.collectionLists[i];
        return collectionListTile(collectionSingleItem);
      },
    );
  }

  Widget collectionListTile(Datum1 collectionSingleItem) {
    String imgUrl = ApiUrl.ApiMainPath + collectionSingleItem.showimg;
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen());
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
