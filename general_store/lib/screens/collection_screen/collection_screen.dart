import 'package:flutter/material.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:get/get.dart';
import '../../models/collection_screen_model/collection_model.dart';

class CollectionScreen extends StatelessWidget {
  // const CollectionPage({Key? key}) : super(key: key);

  List<CollectionSingleItem> collectionLists = [
    CollectionSingleItem(
      collectionImg: ImgUrl.popular1, collectionName: 'Collection Name 1',
    ),
    CollectionSingleItem(
      collectionImg: ImgUrl.popular2, collectionName: 'Collection Name 2',
    ),
    CollectionSingleItem(
      collectionImg: ImgUrl.popular3, collectionName: 'Collection Name 3',
    ),
    CollectionSingleItem(
      collectionImg: ImgUrl.popular4, collectionName: 'Collection Name 4',
    ),
    CollectionSingleItem(
      collectionImg: ImgUrl.popular1, collectionName: 'Collection Name 1',
    ),
    CollectionSingleItem(
      collectionImg: ImgUrl.popular2, collectionName: 'Collection Name 2',
    ),
    CollectionSingleItem(
      collectionImg: ImgUrl.popular3, collectionName: 'Collection Name 3',
    ),
    CollectionSingleItem(
      collectionImg: ImgUrl.popular4, collectionName: 'Collection Name 4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Collections',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: collectionLists.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10, crossAxisSpacing: 10,
            childAspectRatio: 0.9
          ),
          itemBuilder: (context, i){
            return GestureDetector(
              onTap: () {
                // print(collectionLists[i].collectionName);
                Get.to(()=> ProductDetailScreen());
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(collectionLists[i].collectionImg),
                        fit: BoxFit.cover
                      )
                    ),
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
                          collectionLists[i].collectionName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
