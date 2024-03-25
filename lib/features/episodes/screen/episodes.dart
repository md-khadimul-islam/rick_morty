

import 'package:flutter/material.dart';

import '../../../common_widgets/custom_cart.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';
import '../../home/screen/widgets/headers.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
                headerName: 'All Episodes',
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
                    title: 'S01 E0$index',
                    subTitle: 'Pilot',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
}
