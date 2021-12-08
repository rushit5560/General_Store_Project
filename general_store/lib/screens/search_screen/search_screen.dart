import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar('Search'),

      body: Center(
        child: Text('Search Page'),
      ),

    );
  }
}
