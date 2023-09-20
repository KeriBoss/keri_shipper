import 'package:flutter/material.dart';

class ColorConstants {
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const transparent = Colors.transparent;
  static const primaryColor = Color(0xFFe4bc55);
  static const secondColor = Color(0xFFFDF1E4);
  static const thirdColor = Color(0xFFD95BDFF);
  static const fourColor = Color(0xFF656259);
  static const blueLight = Color(0xFF0C4DA2);
  static const whiteGreyColor = Color(0xffE5E5E5);
  static const primaryColorVariant = Color(0xFF4B4B4B);
  static const accentColor = Color(0xFF1e345d);
  static const primaryDarkColor = Color(0xFF2A2A2A);
  static const appBlack = Color(0xFF0D1111);
  static const veryLightGray = Color(0xFFF1F1F1);
  static const lightGrayLow = Color(0xFFF2F2F2);

  static const lightGray = Color(0xFF8B8B8B);
  static const appBlue = Color(0xFFA8A7A7);
  static const veryLightBlue = Color(0xFFD9EAFA);
  static const whiteGrayButtonBackground = Color(0xFFD9D9D9);
  static const redButtonBackground = Color(0xFFFfe613f);
  static const grayLight = Color(0xFFDBD3D3);
  static const grayVeryLight = Color(0xFFf9f9f9);
  static const gray = Color(0xFFA8A7A7);
  static const grayDark = Color(0xFF5F636B);
  static const dividerColor = Color(0xFFBFBFBF);
  static const popupBorderColor = Color(0xFFEEEDED);
  static const veryVeryLightGray = Color(0xFFF4F6F8);
  static const containerBorderColor = Color(0xFFE5E7E9);

  static const whiteGhost = Color(0xFFF3F3F3);
  static const whiteLevel2 = Color(0xFFEBEBEB);
  static const bodyGradientStartColor = Color(0xFFE6E6E6);
  static const dialogGradientEndColor = Color(0xFF000000);
  static const dialogGradientStartColor = Color(0xFF5D6060);
  static const bodyGradientEndColor = Color(0xFF959595);
  static const buttonGradientStartColor = Color(0xFF525555);
  static const buttonGradientEndColor = Color(0xFF141818);

  static const unSelectedWidgetColor = Color(0xFFA1A1A1);
  static const shadowColor = Color(0xFFAE9292);
  static const brownLevel1 = Color(0xFF837D7D);
  static const brownishRed = Color(0xFFAD3131);

  static const bodyTextColor = Color(0xFFB5B5B5);

  static const darkBlack = Color(0xFF5D6060);
  static const grayLevel2 = Color(0xFF5D5D5D);
  static const grayLevel3 = Color(0xFF464646);
  static const grayLevel4 = Color(0xFF5D5D5D);
  static const grayLevel5 = Color(0xFFD2D2D2);
  static const grayLevel6 = Color(0xFFEEEEEE);
  static const grayLevel7 = Color(0xFFF6F6F6);
  static const grayLevel8 = Color(0xFFE3E3E3);
  static const grayWhite = Color(0xFFE8E8E8);
  static const darkGray = Color(0x00000020);
  static const thatch = Color(0xFF827D7D);
  static const imageBackground = Color(0x0D111147);
  static const parrotDark = Color(0xFF40C979);
  static const parrotLight = Color(0xFFEDFBF3);
  static const blackShade = Color(0xFF2C2A2A);
  static const greenShade = Color(0xFFb5762f);
  static const yellowShade = Color(0xFFfeef9a);
  static const parrotGreen = Color(0xFF3FC979);
  static const darkGreen = Color(0xFF5A9433);
  static const lightBlack = Color(0xFF1B1A17);
  static const greenMain = Color.fromARGB(255, 2, 153, 103);

  static Color GetColor(String status) {
    if (status == "Chờ xác nhận") {
      return Colors.orange;
    }
    if (status == "Đã nhận đơn - chờ giao") {
      return ColorConstants.primaryColor;
    }
    if (status == "Đang giao hàng") {
      return Colors.orangeAccent;
    }
    if (status.trim() == "Giao hàng thành công - chờ xác nhận") {
      return Colors.yellow.shade700;
    }
    if (status.trim() == "Đã hủy") {
      return Colors.redAccent.shade700;
    }
    return Colors.green;
  }

  static Color GetColorTrangThaiThanhToanNhapHang(String status) {
    if (status == "Đã thanh toán") {
      return Colors.green;
    }
    if (status == "Chưa thanh toán") {
      return ColorConstants.primaryColor;
    }

    return Colors.green;
  }

  static Color GetColorNhanHang(String status) {
    if (status == "Đã nhận hàng") {
      return Colors.green;
    }
    if (status == "Chưa nhận hàng") {
      return ColorConstants.primaryColor;
    }

    return Colors.green;
  }

  static Color GetColorTrangThaiSuaChua(String status) {
    if (status == "Chờ tiếp nhận") {
      return Colors.yellow;
    }
    if (status == "Đã giao nhân viên") {
      return Colors.orange;
    }
    if (status == "Đang sửa") {
      return Colors.redAccent.shade700;
    }

    if (status.trim() == "Đã xong") {
      return Colors.green;
    }
    if (status.trim() == "Không sửa ráp trả") {
      return Colors.grey.shade700;
    }
    return Colors.green;
  }
}
