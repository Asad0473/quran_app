import 'package:flutter/material.dart';
import 'package:quran_app/utils/appDimensions.dart';
import 'package:quran_app/utils/app_text.dart';
import 'package:quran_app/utils/spaces.dart';
import 'package:quran_app/utils/ui.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();
    Space.init();
    AppText.init();
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
