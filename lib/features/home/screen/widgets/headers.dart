import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/text_style_util.dart';
import 'package:rick_and_morty/utils/utils.dart';

class Headers extends StatelessWidget {
  const Headers(
      {super.key,
      this.buttonName,
      this.onTap,
      required this.headerName,
      this.headerFontSize,
      this.headerColor});

  final String? buttonName;
  final VoidCallback? onTap;
  final String headerName;
  final Color? headerColor;
  final double? headerFontSize;

  @override
  Widget build(BuildContext context) {
    final double fontSize = headerFontSize ?? 17.sp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerName,
          style: AppStyle.semiBoldTS(headerColor ?? Colors.white, fontSize: fontSize),
        ),
        if (buttonName != null)
          GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: 40.h,
              width: 88.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.buttonColor),
              child: Text(
                '$buttonName',
                style: AppStyle.semiBoldTS(Colors.black, fontSize: 13.sp),
              ),
            ),
          ),
      ],
    );
  }
}
