import 'package:flutter/material.dart';

mixin AppColors {
  static const MaterialColor kSwatch = Colors.green;
  static const Color kOrange = Color.fromRGBO(246, 97, 13, 1.0);
  static const Color kRed = Color.fromRGBO(230, 55, 51, 1.0);
  static const Color kGrey = Color.fromRGBO(214, 215, 217,1.0);
  static const Color kGreen = Color.fromRGBO(18,116,3, 1.0);
  static const Color kBlue = Color.fromRGBO(11, 41, 100, 1.0);
  static const Color kBlack = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color kPink=Color.fromRGBO(251, 111, 111, 1);
  static const Color kBlackLight=Color.fromRGBO(143, 133, 133, 1);
  static const Color kBlackMedium=Color.fromRGBO(73, 73, 73, 1);
  static const Color kGreyText=Color.fromRGBO(199, 199, 201, 1);

}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    String _hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (_hexColor.length == 6) {
      _hexColor = "FF$_hexColor";
    }
    return int.parse(_hexColor, radix: 16);
  }
}
