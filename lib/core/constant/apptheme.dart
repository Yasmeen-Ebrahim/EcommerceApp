import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData englishTheme = ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: AppColors.primaryColor
        ),
        backgroundColor: Colors.grey[50],
        titleTextStyle: TextStyle(color: AppColors.primaryColor , fontSize: 20 , fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0.0,
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold , fontSize: 22),
        bodyMedium: TextStyle( height : 1.7 , fontWeight: FontWeight.w500 , color: AppColors.bodytext, fontSize: 15),
        bodyLarge: TextStyle(fontWeight: FontWeight.w500 , color: AppColors.bodytext, fontSize: 20),
        bodySmall: TextStyle(fontSize: 16 , color: AppColors.white)
    ));

ThemeData arabicTheme = ThemeData(
  fontFamily: "Cairo",
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: AppColors.primaryColor
        ),
        backgroundColor: Colors.grey[50],
        titleTextStyle: TextStyle(color: AppColors.primaryColor , fontSize: 18 , fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0.0,
    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold , fontSize: 21),
        bodyMedium: TextStyle( height : 1.7 , fontWeight: FontWeight.w500 , color: AppColors.bodytext, fontSize: 15),
        bodyLarge: TextStyle(fontWeight: FontWeight.w500 , color: AppColors.bodytext, fontSize: 20),
        bodySmall: TextStyle(fontSize: 16 , color: AppColors.white)
    ));