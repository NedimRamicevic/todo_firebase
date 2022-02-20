import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;
  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;

  double get lowWidthValue => MediaQuery.of(this).size.width * 0.1;
  double get lowHeighthValue => MediaQuery.of(this).size.height * 0.01;
}
