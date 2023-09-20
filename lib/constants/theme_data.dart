import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:keri_shipper/constants/color_palette.dart';

import 'color_constants.dart';
import 'font_constants.dart';

ThemeData getAppThemeData() {
  return ThemeData(
    primaryColor: ColorConstants.primaryColor,
    dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white))),
    unselectedWidgetColor: ColorConstants.unSelectedWidgetColor,
    primaryColorDark: ColorConstants.primaryColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorConstants.primaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: ColorConstants.primaryColor,
    ),
    backgroundColor: Colors.white,
    radioTheme: RadioThemeData(
        fillColor: MaterialStatePropertyAll(ColorConstants.primaryColor)),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: ColorConstants.whiteColor,
        elevation: 2,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: FontConstants.comfortaaBold,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorConstants.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: ColorConstants.transparent,
        ),
        iconTheme: IconThemeData(color: ColorPalette.primaryColor)),
    primarySwatch: const MaterialColor(0xFF40C979, {
      50: ColorConstants.grayVeryLight,
      100: ColorConstants.grayLight,
      200: ColorConstants.gray,
      300: ColorConstants.grayLevel2,
      400: ColorConstants.grayDark,
      500: ColorConstants.whiteGrayButtonBackground,
      600: ColorConstants.unSelectedWidgetColor,
      700: ColorConstants.dividerColor,
      800: ColorConstants.primaryDarkColor,
      900: ColorConstants.appBlack
    }),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(ColorPalette.primaryColor)),
    primaryIconTheme: const IconThemeData(color: ColorConstants.fourColor),
    bottomAppBarColor: ColorConstants.appBlack,
    fontFamily: FontConstants.comfortaaRegular,
    shadowColor: ColorConstants.shadowColor,

    highlightColor: ColorConstants.whiteGrayButtonBackground,
    hintColor: ColorConstants.bodyTextColor,
    splashColor: ColorConstants.grayVeryLight,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(5),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyle(
        color: ColorConstants.lightGray,
        fontSize: 14,
        fontFamily: FontConstants.comfortaaMedium,
      ),
      hintStyle: TextStyle(
        color: ColorConstants.lightGray,
        fontSize: 16,
        fontFamily: FontConstants.comfortaaSemiBold,
      ),
      focusColor: ColorConstants.primaryColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 0.7,
          color: ColorConstants.primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Color.fromARGB(226, 139, 139, 139),
        ),
      ),
      hoverColor: ColorConstants.lightGray,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 0.7,
          color: ColorConstants.lightGray,
        ),
      ),
      //filled: true,
      //fillColor: ColorConstants.appBlack,
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(5.w)),
      //   borderSide: const BorderSide(
      //     color: ColorConstants.lightGray,
      //     //width: 10,
      //     style: BorderStyle.solid,
      //   ),
      // ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 0.7,
          color: ColorConstants.lightGray,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 0.7,
          color: ColorConstants.lightGray,
        ),
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorConstants.primaryColor,
      selectionColor: ColorConstants.primaryColor,
      selectionHandleColor: ColorConstants.primaryColor,
    ),

    tabBarTheme: TabBarTheme(
      unselectedLabelColor: ColorConstants.unSelectedWidgetColor,
      labelColor: ColorConstants.appBlue,
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: EdgeInsets.only(bottom: 1.0.w, left: 3.5.w, right: 3.5.w),
      indicator: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.8.w, color: ColorConstants.appBlue))),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.5.sp,
        fontFamily: FontConstants.comfortaaLight,
      ),
      labelStyle: TextStyle(
        fontSize: 14.5.sp,
        color: ColorConstants.appBlue,
        fontFamily: FontConstants.comfortaaLight,
      ),
    ),

    /// Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: ColorConstants.accentColor, width: 1),
        primary: ColorConstants.accentColor,
        padding: const EdgeInsets.symmetric(vertical: 5),
      ),
    ),

    /// Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          backgroundColor: ColorPalette.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 10),
          minimumSize: Size(100.w, 5.h),
          textStyle: TextStyle(color: Colors.white)),
    ),

    /// Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: ColorConstants.accentColor,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: TextStyle(
          fontSize: 16,
          fontFamily: FontConstants.comfortaaBold,
          color: ColorConstants.accentColor,
        ),
      ),
    ),

    /// Icon Button Theme
    iconTheme: const IconThemeData(
      color: ColorConstants.fourColor,
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        letterSpacing: -0.5,
        fontFamily: FontConstants.comfortaaBold,
        color: ColorConstants.appBlack,
      ),
      headline2: TextStyle(
        fontSize: 20,
        letterSpacing: -0.5,
        fontFamily: FontConstants.comfortaaSemiBold,
        color: ColorConstants.blackColor,
      ),
      headline3: TextStyle(
        fontSize: 18,
        //letterSpacing: -0.5,
        fontFamily: FontConstants.comfortaaBold,
        color: ColorConstants.blackColor,
      ),
      headline4: TextStyle(
        fontSize: 16,
        fontFamily: FontConstants.comfortaaBold,
        color: ColorConstants.blackColor,
      ),
      headline5: TextStyle(
        fontSize: 15,
        fontFamily: FontConstants.comfortaaSemiBold,
        color: ColorConstants.blackColor,
      ),
      headline6: TextStyle(
        fontSize: 15,
        fontFamily: FontConstants.comfortaaSemiBold,
        color: ColorConstants.accentColor,
      ),

      // TextField font
      subtitle1: TextStyle(
        fontFamily: FontConstants.comfortaaBold,
      ),
      subtitle2: TextStyle(
        fontSize: 15,
        fontFamily: FontConstants.comfortaaBold,
        color: ColorConstants.whiteColor,
      ),

      /// Using this style for radio button text and other place with 16.0.sp and #0d1111 color
      bodyText1: TextStyle(
        fontSize: 16,
        fontFamily: FontConstants.comfortaaRegular,
        color: ColorConstants.appBlack,
      ),

      /// This style automatically applies on all the [Text]
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: FontConstants.comfortaaMedium,
        color: ColorConstants.blackColor,
      ),

      /// This style automatically applies on the text of [ElevatedButton, OutlinedButton]
      /// also we can define different text style for these button in there respective
      /// theme data above
      button: TextStyle(
        fontSize: 16,
        fontFamily: FontConstants.comfortaaBold,
        color: ColorConstants.accentColor,
      ),
    ),
  );
}
