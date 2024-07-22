import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

class TextStyleManager {
  static final screenTitle = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  ).copyWith(
    color: ColorManager.blackColor,
  );

  static final screenBodySmall = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    fontSize: 12,
  ).copyWith(
    color: ColorManager.greyText,
  );

  static final screenBodyVerySmall = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    fontSize: 11,
  ).copyWith(
    color: ColorManager.blackColor,
  );

  static final textButton = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 12,
  ).copyWith(
    color: ColorManager.primaryColor,
  );

  static final screenBodyMedium = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  ).copyWith(
    color: ColorManager.blackColor,
  );

  static final formText = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  ).copyWith(
    color: ColorManager.greyText,
  );

  static final formHint = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  ).copyWith(
    color: ColorManager.greyHintText,
  );

  static final formLabel = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  ).copyWith(
    color: ColorManager.greyText,
  );
}
