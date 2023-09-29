import 'package:flutter/material.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get italic {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get fontHeader {
    return copyWith(
      fontSize: 22,
      height: 22 / 20,
    );
  }

  TextStyle get fontCaption {
    return copyWith(
      fontSize: 12,
      height: 12 / 10,
    );
  }

  TextStyle get semiBold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w700);
  }


  TextStyle get whiteTextColor {
    return copyWith(color: Colors.white);
  }

  TextStyle get greyTextColor {
    return copyWith(color: Colors.grey);
  }

  // convenience functions
  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
}

extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class TextStyles {
  TextStyles(this.context);

  BuildContext? context;

  static const TextStyle defaultStyle = TextStyle(
    fontSize: 16,
    color: Color(0xff000000),
    fontWeight: FontWeight.w400,
    height: 16 / 14,

  );
}

// How to use?
// Text('test text', style: TextStyles.normalText.semiBold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);