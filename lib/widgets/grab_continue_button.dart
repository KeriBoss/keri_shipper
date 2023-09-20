import 'package:flutter/material.dart';
import 'package:keri_shipper/constants/constant.dart';

class GrabContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Center(
          child: Text(
        "Continue",
        style: kGrabWhiteRegularSmall,
      )),
      onPressed: () {},
    );
  }
}
