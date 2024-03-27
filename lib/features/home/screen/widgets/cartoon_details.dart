import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/utils/text_style_util.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/utils.dart';

class CartoonDetailsScreen extends StatelessWidget {
  const CartoonDetailsScreen({
    super.key,
    required this.nameImage,
  });

  final CombineNameImage nameImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, size: 20.w, color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 100.h,
        flexibleSpace: FlexibleSpaceBar(
            background:
                Utils.showSvgPicture('logo', 'icons', width: double.infinity)),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.r),
        children: [
          Column(
            children: [
              // Cartoon Name Section
              Text(nameImage.name,
                  style: AppStyle.semiBoldTS(AppColors.headerColor,
                      fontSize: 22.sp)),
              SizedBox(height: 20.h),

              // Cartoon Image Section
              buildImageSection(),
              SizedBox(height: 20.h),

              // Cartoon Information Section
              buildCartoonInformationSection(),
            ],
          ),
          SizedBox(height: 16.h),

          // Cartoon Origin Section
          const CartonDetails(
              icon: 'origin',
              title: 'Origin',
              subTitle: 'Earth (C-137)',
              subIcon: 'route'),
          SizedBox(height: 16.h),

          // Cartoon Location Section
          const CartonDetails(
              icon: 'location',
              title: 'Last Known Location',
              subTitle: 'Citadel of Ricks',
              subIcon: 'route')
        ],
      ),
    );
  }

  Widget buildCartoonInformationSection() {
    return Row(
      children: [
        const CartonDetails(icon: 'status', title: 'Status', subTitle: 'Alive'),
        SizedBox(width: 16.w),
        const CartonDetails(
            icon: 'species', title: 'Species', subTitle: 'Human'),
        SizedBox(width: 16.w),
        const CartonDetails(icon: 'gender', title: 'Gender', subTitle: 'Male'),
      ],
    );
  }

  Container buildImageSection() {
    return Container(
      padding: EdgeInsets.all(Utils.scrHeight * .03),
      height: 240.h,
      width: 240.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.0.w, color: AppColors.buttonColor)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset('assets/images/${nameImage.image}.png',
            fit: BoxFit.cover),
      ),
    );
  }
}

class CombineNameImage {
  String name, image;

  CombineNameImage({required this.name, required this.image});
}

class CartonDetails extends StatelessWidget {
  const CartonDetails(
      {super.key, this.title, this.subTitle, this.icon, this.subIcon});

  final String? title;
  final String? subTitle;
  final String? icon;
  final String? subIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      height: 128.h,
      width: 116.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.buttonColor, width: 1.0.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.showSvgPicture('$icon', 'icons', height: 24.h, width: 24.w),
          SizedBox(height: 10.h),
          Text('$title',
              style: AppStyle.semiBoldTS(Colors.white, fontSize: 15.sp)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$subTitle',
                  style: AppStyle.semiBoldTS(Colors.white, fontSize: 22.sp)),
              if (subIcon != null)
                Utils.showSvgPicture('$subIcon', 'icons',
                    height: 20.h, width: 20.w),
            ],
          ),
        ],
      ),
    );
  }
}
