import 'package:flutter/material.dart';
import 'package:rick_and_morty/common_widgets/custom_cart.dart';
import 'package:rick_and_morty/features/home/screen/widgets/headers.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: Utils.scrHeight * .1,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
              background: Utils.showSvgPicture('logo', 'icons'))),
      body: Padding(
        padding: EdgeInsets.all(Utils.scrHeight * .024),
        child: Column(
          children: [
            const Headers(
                headerName: 'All Locations',
                headerColor: AppColors.headerColor,
                headerFontSize: 22),
            SizedBox(height: Utils.scrHeight * .016),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.8,
                  crossAxisSpacing: Utils.scrHeight * .028,
                  mainAxisSpacing: Utils.scrHeight * .024,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return CustomCart(
                    title: '#$index',
                    subTitle: 'Abadango',
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
