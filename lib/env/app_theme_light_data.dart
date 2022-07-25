import 'package:flutter/material.dart';
import 'package:newslist/widgets/widgets.dart';

import 'env.dart';

final myLightThemeData = ThemeData.from(
  // 色の指定は `ColorScheme` を使用することが推奨されている。
  // `DarkTheme` の方は `ColorScheme.dark()` を使用を推奨します。
  colorScheme: const ColorScheme.light().copyWith(
    primary: HexColor(AppColors.mainColor),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),

  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontSize: Sizes.textSizeLarge,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.normal,
      color: HexColor(
        AppColors.textColor,
      ),
      fontSize: Sizes.textSizeLarge,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.normal,
      color: HexColor(
        AppColors.textColor,
      ),
      fontSize: Sizes.textSizeMedium,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.normal,
      color: HexColor(
        AppColors.textColor,
      ),
      fontSize: Sizes.textSizeSmall,
    ),
  ),
).copyWith(
  scaffoldBackgroundColor: HexColor(AppColors.backColor),
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor(AppColors.mainColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: HexColor(AppColors.mainColor),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 2,
  ),
);
