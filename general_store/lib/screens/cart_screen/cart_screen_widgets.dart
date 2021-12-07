import 'package:flutter/material.dart';
import 'package:general_store/common/api_url.dart';
import 'package:general_store/common/app_color.dart';
import 'package:general_store/common/custom_widget.dart';
import 'package:general_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:general_store/models/cart_screen_model/cart_model.dart';
import 'package:general_store/screens/checkout_screen/checkout_screen.dart';
import 'package:get/get.dart';

class ItemCountAndCost extends StatelessWidget {
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${cartScreenController.userCartQuantity} Items',
          style: TextStyle(
              fontSize: 17
          ),
        ),
        const SpacerWidth(5),
        Text('/'),
        const SpacerWidth(5),
        Text(
          'Total Cost \$${cartScreenController.userCartTotalAmount}',
          maxLines: 1,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class CartItemListModule extends StatelessWidget {
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartScreenController.userCartProductLists.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        Cartditeil cartSingleItem = cartScreenController.userCartProductLists[index];
        final imgUrl = ApiUrl.ApiMainPath +
            "asset/uploads/product/" +
            cartSingleItem.showimg;

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
                                  image: NetworkImage('$imgUrl'),
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
                                    '${cartSingleItem.productname}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(),
                                  ),
                                  const SpacerHeight(5),
                                  Text('\$${cartSingleItem.productcost}'),
                                  const SpacerHeight(5),

                                  //Inc & Dec Button
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (cartSingleItem.cquantity > 1) {
                                              var cartItemDec =
                                                  cartSingleItem.cquantity - 1;
                                              print('cartItemDec : $cartItemDec');
                                              cartScreenController.getAddProductCartQty(
                                                      cartItemDec,
                                                      cartSingleItem.cartDetailId,
                                              );
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.kPinkColor,
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              size: 22,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            '${cartSingleItem.cquantity}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var cartItemInc =
                                                cartSingleItem.cquantity + 1;
                                            print('cartItemInc : $cartItemInc');
                                            cartScreenController.getAddProductCartQty(
                                                    cartItemInc,
                                                    cartSingleItem.cartDetailId,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.kPinkColor,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 22,
                                              color: Colors.white,
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
                      cartScreenController.getDeleteProductCart(cartSingleItem.cartDetailId);
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
}

class ProceedButton extends StatelessWidget {
  final cartScreenController = Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print('Proceed Button');
          Get.to(() => CheckOutScreen());
          // Get.to(() => CheckOutPage(),
          //     arguments: cartController.userCartId);
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColor.kPinkColor,
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
