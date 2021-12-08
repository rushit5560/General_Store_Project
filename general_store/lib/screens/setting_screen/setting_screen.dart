import 'package:flutter/material.dart';
import 'package:general_store/common/custom_widget.dart';
import 'setting_screen_widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar('Settings'),

      body: Column(
        children: [
          ChangePasswordModule(),
        ],
      ),

    );
  }
}
