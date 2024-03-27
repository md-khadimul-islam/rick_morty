import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/utils/text_style_util.dart';

import '../utils/app_colors.dart';
import '../utils/utils.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({super.key, this.title, this.subTitle});

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius:
            BorderRadius.only(bottomRight: const Radius.elliptical(70, 70).r),
        child: Container(
          padding: EdgeInsets.all(10.r),
          // height: Utils.scrHeight * .064,
          width: 200.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.buttonColor, width: 1.0.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$title',
                  style: AppStyle.semiBoldTS(Colors.white, fontSize: 10.sp)),
              Text('$subTitle',
                  style: AppStyle.semiBoldTS(Colors.white, fontSize: 13.sp)),
            ],
          ),
        ));
  }
}
