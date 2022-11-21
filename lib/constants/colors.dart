import 'package:flutter/material.dart';

@immutable
class AppColors {
  static final Color greyColor = HexColor("616161");
  static final Color greyB9B9B9 = HexColor("B9B9B9");
  static final Color grey8D8D8D = HexColor("8D8D8D");
  static final Color grey595959= HexColor("595959");
  static final Color appBlueColor = HexColor("3B5DFF");
  static final Color appGreenColor = HexColor("378B80");
  static final Color green5ABA46 = HexColor("5ABA46");
  static final Color lightBlueColor = HexColor("E9EDF9");
  static final Color blackColor = HexColor("394257");
  static final Color shadowColor = HexColor("FEEEEE");
  static final Color red = HexColor("F46160");
  static final Color blue243FCC = HexColor("243FCC");
  static final Color redBE1619 = HexColor("BE1619");
  static final Color whiteF8F9F8 = HexColor("F8F9F8");
  static final Color blue5865E4  = HexColor("5865E4");

  static final List<Color> gradiantColors = [
    HexColor("F0F1F3"),
    HexColor("F0F1F3"),
    HexColor("D7DAEB"),
  ];
  static final List<Color> darkGradiantColors = [
    HexColor("F0F1F3"),
    HexColor("F0F1F3"),
    HexColor("D7DAEB"),
  ];
  static final List<Color> random = [
    HexColor("ED7C9D"),
    HexColor("3A5CFF"),
    HexColor("368B81"),
    HexColor("A74545"),
    HexColor("ED7C9D"),
    HexColor("3A5CFF"),
    HexColor("368B81"),
    HexColor("EBE7FF"),
    HexColor("ED7C9D"),
    HexColor("3A5CFF"),
  ];
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
