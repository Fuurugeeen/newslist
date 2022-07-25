import 'package:flutter/material.dart';

class AppColors {
  // カラーコード : #A66A86 #4B94F2 #63A1F2
  static const String mainColor = '#63A1F2'; //メインカラー
  static const String textColor = '#010326'; //文字色
  // static const String textColor = '#4B94F2'; //文字色
  static const String backColor = '#F4F2F0'; //文字色
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    var color = hexColor.toUpperCase().replaceAll('#', '');
    if (color.length == 6) {
      color = 'FF$color';
    }
    return int.parse(color, radix: 16);
  }
}
