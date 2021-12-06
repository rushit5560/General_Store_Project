import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Center(
        child: Text('Search Page'),
      ),

    );
  }
}
