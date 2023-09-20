import 'package:flutter/material.dart';

import 'package:keri_shipper/constants/constant.dart';

class GrabIconMenu extends StatelessWidget {
  const GrabIconMenu({
    required this.title,
    required this.image,
    this.size = 60,
  });

  final String title;
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          height: size,
          image: AssetImage(image),
        ),
        SizedBox(height: 5),
        Text(title, style: kGrabBlackRegularSmall.copyWith(fontSize: 15)),
      ],
    );
  }
}
