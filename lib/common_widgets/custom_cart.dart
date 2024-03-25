import 'package:flutter/material.dart';
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
            const BorderRadius.only(bottomRight: Radius.elliptical(70, 70)),
        child: Container(
          padding: EdgeInsets.all(Utils.scrHeight * .01),
          // height: Utils.scrHeight * .064,
          width: Utils.scrHeight * .2,
          decoration: BoxDecoration(
            // color: Colors.blue,
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(Utils.scrHeight * .01),
            border: Border.all(color: AppColors.buttonColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$title', style: semiBoldTS(Colors.white, fontSize: 10)),
              Text('$subTitle', style: semiBoldTS(Colors.white, fontSize: 13)),

            ],
          ),
        ));
  }
}
