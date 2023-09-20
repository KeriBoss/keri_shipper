import 'package:flutter/material.dart';
import 'package:keri_shipper/constants/constant.dart';

class FivePercentPadding extends StatelessWidget {
  FivePercentPadding({required this.parent, required this.child});
  final BuildContext parent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: fivePercentWidth(parent),
      ),
      child: child,
    );
  }
}
