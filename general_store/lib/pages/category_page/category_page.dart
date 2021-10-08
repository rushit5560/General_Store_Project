import 'package:flutter/material.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/pages/collection_page/collection_page.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              child: GestureDetector(
                onTap: (){
                  print('Category Index Number : $index');
                  Get.to(()=> CollectionPage());
                },
                child: Container(
                  height: Get.height * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(ImgUrl.popular3),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                        'Category name ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),


    );
  }
}
