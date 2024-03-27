import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/common_widgets/custom_cart.dart';
import 'package:rick_and_morty/common_widgets/custom_cartoon_cart.dart';
import 'package:rick_and_morty/features/home/screen/widgets/cartoon_details.dart';
import 'package:rick_and_morty/features/home/screen/widgets/headers.dart';
import 'package:rick_and_morty/routing/all_routes.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/utils.dart';

import '../../../providers/bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Utils.initScreenSize(context);
    return Scaffold(
        // extendBodyBehindAppBar: true,
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 100.h,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
              background: Utils.showSvgPicture('logo', 'icons')),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 32.r, horizontal: 24.r),
          children: <Widget>[
            // Favourite Section
            Headers(
              buttonName: 'View all',
              headerName: 'Favourites',
              onTap: () {
                Navigator.pushNamed(context, Routes.favourite);
              },
            ),
            SizedBox(height: 16.h),
            buildFavouritesItems(context),
            SizedBox(height: 52.h),

            // Meet the cast Section
            Headers(
              onTap: () {
                Provider.of<BottomNotifier>(context, listen: false)
                    .updateSelectedIndex(1);
              },
              buttonName: 'View all',
              headerName: 'Meet the cast',
            ),
            SizedBox(height: 16.h),
            buildFavouritesItems(context),
            SizedBox(height: 40.h),

            // Locations Section
            Headers(
              buttonName: 'View all',
              headerName: 'Locations',
              onTap: () {
                Provider.of<BottomNotifier>(context, listen: false)
                    .updateSelectedIndex(3);
              },
            ),
            SizedBox(height: 16.h),
            buildLocationSection(),
            SizedBox(height: 40.h),

            // Episodes Section
            Headers(
              buttonName: 'View all',
              headerName: 'Episodes',
              onTap: () {
                Provider.of<BottomNotifier>(context, listen: false)
                    .updateSelectedIndex(2);
              },
            ),
            SizedBox(height: 16.h),
            buildEpisodesSection()
          ],
        ));
  }

  SingleChildScrollView buildEpisodesSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const CustomCart(title: 'S01 E01', subTitle: 'Pilot'),
          SizedBox(width: 24.w),
          const CustomCart(title: 'S01 E02', subTitle: 'Lawnmower Dog'),
          SizedBox(width: 24.w),
          const CustomCart(title: 'S01 E03', subTitle: 'Anatomy Park'),
          SizedBox(width: 24.w),
          const CustomCart(title: 'S01 E04', subTitle: 'Meeseeks and Destroy'),
          SizedBox(width: 24.w),
          const CustomCart(title: 'S01 E05', subTitle: 'Meeseeks and Destroy'),
          SizedBox(width: 24.w),
        ],
      ),
    );
  }

  SingleChildScrollView buildLocationSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const CustomCart(title: '#1', subTitle: 'Earth(c-137)'),
          SizedBox(width: 24.w),
          const CustomCart(title: '#1', subTitle: 'Citadel of ricks'),
          SizedBox(width: 24.w),
          const CustomCart(title: '#1', subTitle: 'Abadango'),
          SizedBox(width: 24.w),
          const CustomCart(title: '#1', subTitle: 'Anatomy Park'),
          SizedBox(width: 24.w),
          const CustomCart(title: '#1', subTitle: 'Anatomy Park'),
          SizedBox(width: 24.w),
        ],
      ),
    );
  }

  SingleChildScrollView buildFavouritesItems(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCartoonCart(
            onTap: () {
              Navigator.pushNamed(context, Routes.details,
                  arguments: CombineNameImage(
                      name: 'Rick Sanchez', image: 'rick_sanchez'));
            },
            cartImage: 'rick_sanchez',
            cartName: 'Rick Sanchez',
          ),
          SizedBox(width: 14.w),
          CustomCartoonCart(
            onTap: () {
              Navigator.pushNamed(context, Routes.details,
                  arguments: CombineNameImage(
                      name: 'Morty Smith', image: 'morty_smith'));
            },
            cartImage: 'morty_smith',
            cartName: 'Morty Smith',
          ),
          SizedBox(width: 14.w),
          CustomCartoonCart(
            onTap: () {
              Navigator.pushNamed(context, Routes.details,
                  arguments: CombineNameImage(
                      name: 'Beth Smith', image: 'beth_smith'));
            },
            cartImage: 'beth_smith',
            cartName: 'Beth Smith',
          ),
          SizedBox(width: 14.w),
          CustomCartoonCart(
            onTap: () {
              Navigator.pushNamed(context, Routes.details,
                  arguments: CombineNameImage(
                      name: 'Summer Smith', image: 'summer_smith'));
            },
            cartImage: 'summer_smith',
            cartName: 'Summer Smith',
          ),
          SizedBox(width: 14.w),
          CustomCartoonCart(
            onTap: () {
              Navigator.pushNamed(context, Routes.details,
                  arguments: CombineNameImage(
                      name: 'Jerry Smith', image: 'jerry_smith'));
            },
            cartImage: 'jerry_smith',
            cartName: 'Jerry Smith',
          ),
        ],
      ),
    );
  }
}
