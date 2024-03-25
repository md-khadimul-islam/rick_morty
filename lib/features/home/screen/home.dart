import 'package:flutter/material.dart';
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
          toolbarHeight: Utils.scrHeight * .1,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
              background: Utils.showSvgPicture('logo', 'icons')),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              vertical: Utils.scrHeight * .032,
              horizontal: Utils.scrHeight * .024),
          children: <Widget>[
            // Favourite Section
            Headers(
              buttonName: 'View all',
              headerName: 'Favourites',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.favourite,
                  (route) => false,
                );
              },
            ),
            SizedBox(height: Utils.scrHeight * .016),
            buildFavouritesItems(context),
            SizedBox(height: Utils.scrHeight * .052),

            // Meet the cast Section
            Headers(
              onTap: () {
                Provider.of<BottomNotifier>(context, listen: false)
                    .updateSelectedIndex(1);
              },
              buttonName: 'View all',
              headerName: 'Meet the cast',
            ),
            SizedBox(height: Utils.scrHeight * .016),
            buildFavouritesItems(context),
            SizedBox(height: Utils.scrHeight * .04),

            // Locations Section
            Headers(
              buttonName: 'View all',
              headerName: 'Locations',
              onTap: () {
                Provider.of<BottomNotifier>(context, listen: false)
                    .updateSelectedIndex(3);
              },
            ),
            SizedBox(height: Utils.scrHeight * .016),
            buildLocationSection(),
            SizedBox(height: Utils.scrHeight * .04),

            // Episodes Section
            Headers(
              buttonName: 'View all',
              headerName: 'Episodes',
              onTap: () {
                Provider.of<BottomNotifier>(context, listen: false)
                    .updateSelectedIndex(2);
              },
            ),
            SizedBox(height: Utils.scrHeight * .016),
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
          SizedBox(width: Utils.scrHeight * .024),
          const CustomCart(title: 'S01 E02', subTitle: 'Lawnmower Dog'),
          SizedBox(width: Utils.scrHeight * .024),
          const CustomCart(title: 'S01 E03', subTitle: 'Anatomy Park'),
          SizedBox(width: Utils.scrHeight * .024),
          const CustomCart(title: 'S01 E04', subTitle: 'Meeseeks and Destroy'),
          SizedBox(width: Utils.scrHeight * .024),
          const CustomCart(title: 'S01 E05', subTitle: 'Meeseeks and Destroy'),
          SizedBox(width: Utils.scrHeight * .024),
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
          SizedBox(width: Utils.scrHeight * .024),
          const CustomCart(title: '#1', subTitle: 'Citadel of ricks'),
          SizedBox(width: Utils.scrHeight * .024),
          const CustomCart(title: '#1', subTitle: 'Abadango'),
          SizedBox(width: Utils.scrHeight * .024),
          const CustomCart(title: '#1', subTitle: 'Anatomy Park'),
          SizedBox(width: Utils.scrHeight * .024),
          const CustomCart(title: '#1', subTitle: 'Anatomy Park'),
          SizedBox(width: Utils.scrHeight * .024),
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
          SizedBox(width: Utils.scrHeight * .014),
          CustomCartoonCart(
            onTap: () {
              Navigator.pushNamed(context, Routes.details,
                  arguments: CombineNameImage(
                      name: 'Morty Smith', image: 'morty_smith'));
            },
            cartImage: 'morty_smith',
            cartName: 'Morty Smith',
          ),
          SizedBox(width: Utils.scrHeight * .014),
          CustomCartoonCart(
            onTap: () {
              Navigator.pushNamed(context, Routes.details,
                  arguments: CombineNameImage(
                      name: 'Beth Smith', image: 'beth_smith'));
            },
            cartImage: 'beth_smith',
            cartName: 'Beth Smith',
          ),
          SizedBox(width: Utils.scrHeight * .014),
          CustomCartoonCart(
            onTap: () {
              Navigator.pushNamed(context, Routes.details,
                  arguments: CombineNameImage(
                      name: 'Summer Smith', image: 'summer_smith'));
            },
            cartImage: 'summer_smith',
            cartName: 'Summer Smith',
          ),
          SizedBox(width: Utils.scrHeight * .014),
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
