import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          icon: const Icon(CupertinoIcons.back, size: 20, color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: Utils.scrHeight * .1,
        flexibleSpace: FlexibleSpaceBar(
            background:
                Utils.showSvgPicture('logo', 'icons', width: double.infinity)),
      ),
      body: ListView(
        padding: EdgeInsets.all(Utils.scrHeight * .024),
        children: [
          Column(
            children: [
              // Cartoon Name Section
              Text(nameImage.name,
                  style: semiBoldTS(AppColors.headerColor, fontSize: 22)),
              SizedBox(height: Utils.scrHeight * .02),

              // Cartoon Image Section
              buildImageSection(),
              SizedBox(height: Utils.scrHeight * .02),

              // Cartoon Information Section
              buildCartoonInformationSection(),
            ],
          ),
          SizedBox(height: Utils.scrHeight * .016),

          // Cartoon Origin Section
          const CartonDetails(
              icon: 'origin',
              title: 'Origin',
              subTitle: 'Earth (C-137)',
              subIcon: 'route'),
          SizedBox(height: Utils.scrHeight * .016),

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
        SizedBox(width: Utils.scrHeight * .016),
        const CartonDetails(
            icon: 'species', title: 'Species', subTitle: 'Human'),
        SizedBox(width: Utils.scrHeight * .016),
        const CartonDetails(icon: 'gender', title: 'Gender', subTitle: 'Male'),
      ],
    );
  }

  Container buildImageSection() {
    return Container(
      padding: EdgeInsets.all(Utils.scrHeight * .03),
      height: Utils.scrHeight * .24,
      width: Utils.scrHeight * .24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Utils.scrHeight * .01),
          border: Border.all(width: 1.0, color: AppColors.buttonColor)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Utils.scrHeight * .01),
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
      padding: EdgeInsets.symmetric(
          horizontal: Utils.scrHeight * .016, vertical: Utils.scrHeight * .008),
      height: Utils.scrHeight * .128,
      width: Utils.scrHeight * .13,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Utils.scrHeight * .01),
          border: Border.all(color: AppColors.buttonColor, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.showSvgPicture('$icon', 'icons', height: 24, width: 24),
          SizedBox(height: Utils.scrHeight * .01),
          Text('$title', style: semiBoldTS(Colors.white, fontSize: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$subTitle', style: semiBoldTS(Colors.white, fontSize: 22)),
              if (subIcon != null)
                Utils.showSvgPicture('$subIcon', 'icons',
                    height: 20, width: 20),
            ],
          ),
        ],
      ),
    );
  }
}
