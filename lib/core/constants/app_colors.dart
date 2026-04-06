import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors{
  static const Color primaryColor = Color(0xff3F80FF);
  static const Color borderColor = Color(0xb3b2ccff);
  static MaterialColor primaryMaterialColor = MaterialColor(
    0xff3F80FF,
    <int, Color>{
      50: Color(0xffE8F0FF),
      100: Color(0xffC7DFFF),
      200: Color(0xffA3C5FF),
      300: Color(0xff7FABFF),
      400: Color(0xff5C91FF),
      500: Color(0xff3F80FF), // اللون الأساسي
      600: Color(0xff2A6BD6),
      700: Color(0xff1E5ACC),
      800: Color(0xff1240A3),
      900: Color(0xff0A2A6B),
    },
  );
}