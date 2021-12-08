import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar('Favourite'),

      body: Center(
        child: Text('Favourite Page'),
      ),

    );
  }
}
