import 'package:flutter/material.dart';

import 'color_resource.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.grey[800],
      cardColor: ColorResource.blackColor,
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
      hintColor: ColorResource.whiteColor,
      primaryColor: ColorResource.whiteColor,
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: ColorResource.whiteColor),
        bodyLarge: TextStyle(color: ColorResource.whiteColor),
        bodySmall: TextStyle(color: ColorResource.whiteColor),
        displayLarge: TextStyle(color: ColorResource.whiteColor),
        displayMedium: TextStyle(color: ColorResource.whiteColor),
        displaySmall: TextStyle(color: ColorResource.whiteColor),
        headlineLarge: TextStyle(color: ColorResource.whiteColor),
        headlineMedium: TextStyle(color: ColorResource.whiteColor),
        headlineSmall: TextStyle(color: ColorResource.whiteColor),
        labelLarge: TextStyle(color: ColorResource.whiteColor),
        labelMedium: TextStyle(color: ColorResource.whiteColor),
        labelSmall: TextStyle(color: ColorResource.whiteColor),
        titleLarge: TextStyle(color: ColorResource.whiteColor),
        titleMedium: TextStyle(color: ColorResource.whiteColor),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[800]),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: ColorResource.whiteColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}