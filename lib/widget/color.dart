import 'package:flutter/material.dart';
import 'AppColors.dart';
// Make sure this file contains your AppColors class

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.yellow, // ECA61B
  scaffoldBackgroundColor: AppColors.white, // FFFFFF

  appBarTheme: AppBarTheme(
    color: AppColors.yellow, // ECA61B
    iconTheme: IconThemeData(color: AppColors.black), // 000000
    titleTextStyle: TextStyle(
      color: AppColors.black, // 000000
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkGrey), // 202020
    bodyMedium: TextStyle(color: AppColors.black), // 000000
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.blue, // 004CFF
      foregroundColor: AppColors.white, // FFFFFF
    ),
  ),
);
