import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle style32Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 32),
      fontWeight: FontWeight.w700,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style20Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 20),
      fontWeight: FontWeight.w700,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style16Regular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 16),
      fontWeight: FontWeight.w400,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style14SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w600,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style22SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 22),
      fontWeight: FontWeight.w600,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style14Regular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 14),
      fontWeight: FontWeight.w400,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style12Regular(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 12),
      fontWeight: FontWeight.w400,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style18Medium(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 18),
      fontWeight: FontWeight.w500,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style18Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 18),
      fontWeight: FontWeight.w700,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style24Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 24),
      fontWeight: FontWeight.w700,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style28Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 28),
      fontWeight: FontWeight.w700,

      fontFamily: 'Poppins',
    );
  }

  static TextStyle style26Bold(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: 26),
      fontWeight: FontWeight.w700,

      fontFamily: 'Poppins',
    );
  }
}

double getResponsiveScaleFactor(
  BuildContext context, {
  required double fontSize,
}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = responsiveFontSize * 0.8;
  double upperLimit = responsiveFontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width <= 600) {
    return width / 400;
  } else if (width <= 1200) {
    return width / 1000;
  } else {
    return width / 1750;
  }
}
