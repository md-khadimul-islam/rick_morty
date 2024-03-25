import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/text_style_util.dart';
import 'package:rick_and_morty/utils/utils.dart';

class Headers extends StatelessWidget {
  const Headers(
      {super.key,
      this.buttonName,
      this.onTap,
      required this.headerName,
      this.headerFontSize = 17,
      this.headerColor});

  final String? buttonName;
  final VoidCallback? onTap;
  final String headerName;
  final Color? headerColor;
  final double headerFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerName,
          style: semiBoldTS(headerColor ?? Colors.white, fontSize: headerFontSize),
        ),
        if (buttonName != null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: Utils.scrHeight * .04,
              width: Utils.scrHeight * .088,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Utils.scrHeight * .01),
                  color: AppColors.buttonColor),
              child: Text(
                '$buttonName',
                style: semiBoldTS(Colors.black, fontSize: 13),
              ),
            ),
          ),
      ],
    );
  }
}
