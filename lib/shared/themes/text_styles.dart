
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jr_up/shared/themes/app_colors.dart';

///Estilização do app
class TextStyles {
  static final TextStyle titleHome = GoogleFonts.lexendDeca(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static final TextStyle titleWithe = GoogleFonts.lexendDeca(
    fontSize: 12,
    fontWeight: FontWeight.w100,
    color: Colors.white,


  );
  static final TextStyle titleRegular = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnSecondary,
  );
  static final TextStyle titleBoldHeading = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );

  static final TextStyle titleBoldBackground = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final TextStyle titleListTile = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static final TextStyle titleListTile2 = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textOnPrimary,
  );
  static final TextStyle titleListTile3Black = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final TextStyle trailingRegular = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );
  static final TextStyle trailingBold = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
  static final TextStyle buttonPrimary = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
  static final TextStyle buttonHeading = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );

  static final TextStyle buttonBackground = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final buttonBoldPrimary = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static final buttonBoldHeading = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.heading,
  );

  static final buttonBoldBackground = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textOnSecondary,
  );

  static final captionBackground = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final captionShape = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final captionBody = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  static final TextStyle captionBoldBackground = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final captionBoldShape = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final captionBoldBody = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
}