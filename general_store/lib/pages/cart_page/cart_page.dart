import 'package:flutter/material.dart';
import 'package:general_store/common/custom_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/common/img_url.dart';
import 'package:general_store/pages/cart_page/cart_model.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  // const CartPage({Key? key}) : super(key: key);

  List<CartItemInfo> cartItemLists = [
    CartItemInfo(
      productImgUrl: ImgUrl.popular1,
      productName: 'Product Name here Product Name here Product Name here',
      productActivePrice: '20.00',
      productQty: 1
    ),
    CartItemInfo(
        productImgUrl: ImgUrl.popular2,
        productName: 'Product Name here',
        productActivePrice: '25.00',
        productQty: 1
    ),
    CartItemInfo(
        productImgUrl: ImgUrl.popular3,
        productName: 'Product Name here',
        productActivePrice: '35.00',
        productQty: 1
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          const SpacerHeight(10),
          itemCountAndCost(),
          const SpacerHeight(10),
          cartItemsList(),
          const SpacerHeight(20),
          proceedButton(),
        ],
      ),
    );
  }

  Widget itemCountAndCost() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '3 Items',
          style: TextStyle(
              fontSize: 17
          ),
        ),
        const SpacerWidth(5),
        Text('/'),
        const SpacerWidth(5),
        Text(
          'Total Cost \$250.00',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget cartItemsList() {
    return ListView.builder(
      itemCount: cartItemLists.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //1st Element in Row
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [

                          // Image Container
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                    '${cartItemLists[index].productImgUrl}',
                                ),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          const SpacerWidth(10),

                          //Product Name & Price
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cartItemLists[index].productName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(),
                                  ),
                                  const SpacerHeight(5),
                                  Text('\$${cartItemLists[index].productActivePrice}'),
                                  const SpacerHeight(5),

                                  //Inc & Dec Button
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        GestureDetector(
                                          onTap: () {
                                            // if(cartItemLists[index].productQty > 1){
                                            //   var cartItemDec = cartItemLists[index].productQty - 1;
                                            //   print('$cartItemDec');
                                            // }
                                            print('${cartItemLists[index].productQty}');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                             border: Border(
                                               right: BorderSide(color: Colors.grey),
                                             ),
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              size: 25,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Text(
                                              '${cartItemLists[index].productQty}',
                                            style: TextStyle(
                                                fontSize: 16
                                            ),
                                          ),
                                        ),

                                        GestureDetector(
                                          onTap: () {
                                            var cartItemInc = cartItemLists[index].productQty + 1;
                                            print('$cartItemInc');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(color: Colors.grey),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 25,
                                            ),
                                          ),
                                        ),
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
                  ),


                  //2nd Element in Row
                  GestureDetector(
                    onTap: (){
                      print('Clicked on Delete Button on Index $index');
                    },
                    child: Container(
                      child: Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget proceedButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print('Proceed Button');
          // Get.to(() => CheckOutPage(),
          //     arguments: cartController.userCartId);
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kPinkColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Text(
                  'Proceed To Checkout',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )),
        ),
      ),
    );
  }
}
