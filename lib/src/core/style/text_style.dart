import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "app_colors.dart";

@immutable
class AppTextStyle extends TextTheme {
  const AppTextStyle();

  @override
  TextStyle? get displayLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size30,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get displayMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size20,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get displaySmall => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get headlineMedium => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get headlineSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size8,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get titleLarge => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size18,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 2,
      );

  @override
  TextStyle? get titleMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size16,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get titleSmall => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get bodyLarge => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size11,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get bodyMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size11,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get bodySmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get labelLarge => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size7,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );

  @override
  TextStyle? get labelSmall => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size11,
        color: AppColors.c1E1E1E,
        fontFamily: "OpenSans-Regular",
        letterSpacing: 1,
      );
}

@immutable
class FontSize {
  const FontSize._();

  static double size7 = 7.sp;
  static double size8 = 8.sp;
  static double size11 = 11.sp;
  static double size12 = 12.sp;
  static double size14 = 14.sp;
  static double size16 = 16.sp;
  static double size18 = 18.sp;
  static double size20 = 20.sp;
  static double size22 = 22.sp;
  static double size24 = 24.sp;
  static double size30 = 30.sp;
  static double size32 = 32.sp;
}
