import 'package:flutter/material.dart';
import 'app_dimension.dart';
import 'color_resource.dart';

class LightTheme {
  static ThemeData get theme => ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorResource.scaffoldColor,
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,surfaceTintColor: Colors.transparent),
    iconTheme: IconThemeData(color: ColorResource.blackColor),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorResource.appThemeColor),
    textTheme: TextTheme(
        bodyMedium: TextStyle(color: ColorResource.blackColor),
        bodyLarge: TextStyle(color: ColorResource.blackColor),
        bodySmall: TextStyle(color: ColorResource.blackColor),
        displayLarge: TextStyle(color: ColorResource.blackColor),
        displayMedium: TextStyle(color: ColorResource.blackColor),
        displaySmall: TextStyle(color: ColorResource.blackColor),
        headlineLarge: TextStyle(color: ColorResource.blackColor),
        headlineMedium: TextStyle(color: ColorResource.blackColor),
        headlineSmall: TextStyle(color: ColorResource.blackColor),
        labelLarge: TextStyle(color: ColorResource.blackColor),
        labelMedium: TextStyle(color: ColorResource.blackColor),
        labelSmall: TextStyle(color: ColorResource.blackColor),
        titleLarge: TextStyle(color: ColorResource.blackColor),
        titleMedium: TextStyle(color: ColorResource.blackColor),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.white,shape: null,endShape: null),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: ColorResource.borderColor,fontSize: 14.sp),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60.0),// Customize when disabled
        borderSide: BorderSide(color: ColorResource.borderColor), // Example color
      ), // Or UnderlineInputBorder()
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60.0),// Customize when enabled
        borderSide: BorderSide(color: ColorResource.borderColor), // Example color
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60.0),// Customize when focused
        borderSide: BorderSide(color: ColorResource.greyColor), // Example color
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60.0),// Customize when error
        borderSide: BorderSide(color: ColorResource.appThemeColor), // Example color
      ),
    )
  );
}