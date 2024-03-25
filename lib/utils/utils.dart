import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Utils {
  static late double scrHeight;
  static late double scrWidth;

  // Responsive Screen Size
  static void initScreenSize(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    scrHeight = size.height;
    scrWidth = size.width;
  }

  // Show SvgImage
  static Widget showSvgPicture(String svg, String folder,
          {double? height = 16, double? width = 16}) =>
      SvgPicture.asset(
        height: height,
        width: width,
        "assets/$folder/$svg.svg",
        fit: BoxFit.contain,
      );

  // Show PngImage
  static Widget showPngImage(String imageName, String folder,
      {double? height, double? width}) {
    return Image.asset("assets/$folder/$imageName.png",
        fit: BoxFit.cover, height: height, width: width);
  }
}
