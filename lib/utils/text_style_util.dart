import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle regularTS(Color color, {double? fontSize}) {
    double defaultFontSize = fontSize ?? 12.sp;
    return GoogleFonts.plusJakartaSans(
      textStyle: TextStyle(
        decoration: TextDecoration.none,
        color: color,
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  TextStyle mediumTS(Color color,
          {double? fontSize = 14, bool isUnderline = false}) =>
      GoogleFonts.plusJakartaSans(
          textStyle: TextStyle(
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w500));

  static TextStyle semiBoldTS(Color color, {double? fontSize}) {
    double defaultFontSize = fontSize ?? 16.sp;
    return GoogleFonts.plusJakartaSans(
      textStyle: TextStyle(
        decoration: TextDecoration.none,
        color: color,
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  TextStyle largeTS(Color color, {double? fontSize = 24}) =>
      GoogleFonts.plusJakartaSans(
          textStyle: TextStyle(
              decoration: TextDecoration.none,
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w700));
}
