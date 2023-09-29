import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:keri_shipper/constants/color_palette.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorPalette.secondColor,
        child: const SpinKitFadingCircle(
          color: ColorPalette.whiteColor,
          size: 50,
        ));
  }
}
