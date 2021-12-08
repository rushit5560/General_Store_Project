import 'package:flutter/material.dart';
import 'setting_screen_widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Column(
        children: [
          ChangePasswordModule(),
        ],
      ),

    );
  }
}
