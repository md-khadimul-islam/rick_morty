import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/home/screen/widgets/headers.dart';

import '../../../../common_widgets/custom_cartoon_cart.dart';
import '../../../../routing/all_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/utils.dart';
import 'cartoon_details.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: Utils.scrHeight * .1,
        automaticallyImplyLeading: false,
        flexibleSpace:
            FlexibleSpaceBar(background: Utils.showSvgPicture('logo', 'icons')),
      ),
      body: Padding(
        padding: EdgeInsets.all(Utils.scrHeight * .024),
        child: Column(
          children: [
            const Headers(
                headerName: 'All Favourites',
                headerColor: AppColors.headerColor,
                headerFontSize: 22),
            SizedBox(height: Utils.scrHeight * .016),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: Utils.scrHeight * .028,
                  mainAxisSpacing: Utils.scrHeight * .028,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CustomCartoonCart(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.details,
                          arguments: CombineNameImage(
                              name: 'Rick Sanchez', image: 'rick_sanchez'));
                    },
                    cartName: 'Rick Sanchez',
                    cartImage: 'rick_sanchez',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
