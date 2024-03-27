import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    String filterString = 'Status';
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 100.h,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, size: 20.w, color: Colors.white),
        ),
        flexibleSpace:
            FlexibleSpaceBar(background: Utils.showSvgPicture('logo', 'icons')),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 48.h,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter value';
                  }
                  return null;
                },
                onChanged: (value) {
                  // pageBloc
                  //     .add(SearchEvent({filterString: "\"" + value + "\""}));
                },
                decoration: InputDecoration(
                  suffixIcon:
                      Icon(Icons.search, size: 22.w, color: Colors.white),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  prefixIcon: Container(
                    // height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: AppColors.headerColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          bottomLeft: Radius.circular(24.r)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          bottomLeft: Radius.circular(24.r)),
                      child: DropdownSearch<String>(
                        popupProps: const PopupProps.menu(),
                        items: const [
                          "name",
                          "species",
                          "type",
                          "gender",
                          "status"
                        ],
                        onChanged: (value) {
                          filterString = value ?? "name";
                        },
                        selectedItem: filterString,
                      ),
                    ),
                  ),
                  fillColor: AppColors.greyColor,
                  filled: true,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white, height: .8.h),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r)),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Headers(
                headerName: 'All Favourites',
                headerColor: AppColors.headerColor,
                headerFontSize: 22.sp),
            SizedBox(height: 16.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 28.h,
                mainAxisSpacing: 28.w,
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
            )
          ],
        ),
      ),
    );
  }
}
