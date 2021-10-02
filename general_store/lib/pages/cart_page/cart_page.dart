import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';

class CartPage extends StatelessWidget {
  // const CartPage({Key? key}) : super(key: key);

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
          SpacerHeight(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '3 Items',
                style: TextStyle(
                  fontSize: 17
                ),
              ),
              SpacerWidth(5),
              Text('/')
            ],
          ),
        ],
      ),
    );
  }
}
