import 'package:flutter/material.dart';

// Widget spacerHeight(double value){
//   return SizedBox(height: value);
// }

// Widget spacerWidth(double value) {
//   return SizedBox(width: value);
// }

// Widget customDivider() {
//   return Divider(thickness: 1);
// }

class SpacerHeight extends StatelessWidget {
  final double value;
  // const SpacerHeight({Key? key, required this.value}) : super(key: key);
  const SpacerHeight(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}

class SpacerWidth extends StatelessWidget {
  final double value;
  // const SpacerWidth({Key? key, required this.value}) : super(key: key);
  const SpacerWidth(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}

class CustomDivider extends StatelessWidget {
  // const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1);
  }
}




