import 'package:flutter/material.dart';

import '/core/utils/resources/resources_exporter.dart';

class ThemManager {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: ColorManager.primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorManager.whiteColor,
          foregroundColor: ColorManager.blackColor,
          shadowColor: ColorManager.whiteColor,
          surfaceTintColor: ColorManager.whiteColor,
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: ColorManager.whiteColor,
        brightness: Brightness.dark,
      );

  static const focusBorderDecoration = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorManager.primaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        16.00,
      ),
    ),
  );
  static const borderDecoration = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorManager.formGrey,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        16.00,
      ),
    ),
  );
  static const errorBorderDecoration = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorManager.redColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(
        16.00,
      ),
    ),
  );
  static final formDecoration = InputDecoration(
    filled: true,
    fillColor: ColorManager.formGrey,
    hintStyle: TextStyleManager.formHint,
    labelStyle: TextStyleManager.formLabel,
    errorStyle: TextStyleManager.screenBodyVerySmall.copyWith(
      color: ColorManager.redColor,
    ),
    isDense: true,
    focusedBorder: focusBorderDecoration,
    enabledBorder: borderDecoration,
    disabledBorder: borderDecoration,
    errorBorder: errorBorderDecoration,
    border: borderDecoration,
    focusedErrorBorder: errorBorderDecoration,
  );
}
