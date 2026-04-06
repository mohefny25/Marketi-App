import 'package:flutter/material.dart';
import 'package:marketi_app/core/constants/app_colors.dart';

class ThemeManger{

static ThemeData lightTheme()=>ThemeData(
  primarySwatch: AppColors.primaryMaterialColor,
  colorScheme:ColorScheme.light().copyWith(primary: AppColors.primaryColor),
  scaffoldBackgroundColor: Colors.white,



);

static ThemeData darkTheme()=>ThemeData(
  primarySwatch: AppColors.primaryMaterialColor,
  colorScheme: ColorScheme.dark().copyWith(primary: AppColors.primaryColor),
  scaffoldBackgroundColor: Colors.black
);
}