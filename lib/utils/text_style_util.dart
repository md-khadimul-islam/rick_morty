import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle regularTS(Color color, {double? fontSize = 12}) =>
    GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
            decoration: TextDecoration.none,
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w400));

TextStyle mediumTS(Color color,
        {double? fontSize = 14, bool isUnderline = false}) =>
    GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
            decoration:
                isUnderline ? TextDecoration.underline : TextDecoration.none,
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w500));

TextStyle semiBoldTS(Color color, {double? fontSize = 16}) =>
    GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
            decoration: TextDecoration.none,
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w600));

TextStyle largeTS(Color color, {double? fontSize = 24}) =>
    GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
            decoration: TextDecoration.none,
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w700));
