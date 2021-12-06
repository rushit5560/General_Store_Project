import 'package:flutter/material.dart';

import 'img_url.dart';

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

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImgUrl.servicebg),
              fit: BoxFit.cover
          ),
        )
    );
  }
}



