import 'package:flutter/material.dart';
import 'package:zembo_agent_app/core/constants/app_assets.dart';

///
class UiUtil {
  ///
  const UiUtil(this.context);

  ///
  final BuildContext context;

  ///
  double get width => MediaQuery.of(context).size.width;

  ///
  double get height => MediaQuery.of(context).size.height;

  ///
  double get scale => mockUpWidth / width;

  ///
  double get textScaleFactor => width / mockUpWidth;

  ThemeData get theme => Theme.of(context);

  ///
  double scaleWidthFactor(double inputWidth) =>
      inputWidth / mockUpWidth * width;

  ///
  double scaleHeightFactor(double inputWidth) =>
      inputWidth / mockUpHeight * height;
}
