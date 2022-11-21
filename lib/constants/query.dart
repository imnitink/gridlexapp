
import 'package:flutter/material.dart';

MediaQueryData mediaQueryData(BuildContext context) {
  return MediaQuery.of(context);
}

Size size(BuildContext buildContext) {
  return mediaQueryData(buildContext).size;
}

double deviceWidth(BuildContext context) {
  return size(context).width;
}

double deviceHeight(BuildContext context) {
  return size(context).height;
}
