import 'package:flutter/material.dart';
import 'size_config.dart';
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double ekranGenisligi;
  static double ekranYuksekligi;
  static Orientation orientation;
}

double yuksekligeGoreAyarla(BuildContext context,double inputHeight) {
  double ekranYuksekligi = MediaQuery.of(context).size.height;
  return (inputHeight / 812.0) * ekranYuksekligi;
}

double genisligeGoreAyarla(BuildContext context,double inputWidth) {
  double ekranGenisligi = MediaQuery.of(context).size.width;
  return (inputWidth / 375.0) * ekranGenisligi;
}
