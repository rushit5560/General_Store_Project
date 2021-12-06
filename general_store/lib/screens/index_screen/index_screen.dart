import 'package:flutter/material.dart';
import 'package:general_store/screens/favorite_screen/favorite_screen.dart';
import 'package:general_store/screens/home_screen/home_screen.dart';
import 'package:general_store/screens/profile_screen/profile_screen.dart';
import 'package:general_store/screens/search_screen/search_screen.dart';
import 'package:get/get.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexScreen> {

  int _currentIndex = 0;

  final tabs = [HomeScreen(), SearchScreen(), FavoriteScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 2),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: Get.height * 0.08,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: Colors.black,
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                  print(_currentIndex);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
