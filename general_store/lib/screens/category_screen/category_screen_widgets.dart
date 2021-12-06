import 'package:flutter/material.dart';
import 'package:general_store/common/api_url.dart';
import 'package:general_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:general_store/models/category_screen_model/category_model.dart';
import 'package:general_store/screens/collection_screen/collection_screen.dart';
import 'package:get/get.dart';

class CategoryListModule extends StatelessWidget {
  CategoryListModule({Key? key}) : super(key: key);
  final categoryScreenController = Get.find<CategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryScreenController.categoryLists.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        Datum categorySingleItem = categoryScreenController.categoryLists[index];
        return _categoryListTile(categorySingleItem, index);
      },
    );
  }

  Widget _categoryListTile(Datum categorySingleItem, int index) {
    final imgUrl = ApiUrl.ApiMainPath +
        '${categorySingleItem.showimg}';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 10,
        child: GestureDetector(
          onTap: (){
            Get.to(()=> CollectionScreen());
          },
          child: Container(
            height: Get.height * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage('$imgUrl'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                '${categorySingleItem.categoryName}',
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
  }
}
