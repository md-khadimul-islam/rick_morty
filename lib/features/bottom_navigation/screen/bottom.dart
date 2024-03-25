import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/cast/screen/cast.dart';
import 'package:rick_and_morty/features/episodes/screen/episodes.dart';
import 'package:rick_and_morty/features/locations/screen/locations.dart';

import '../../../providers/bottom.dart';
import '../../../utils/utils.dart';
import '../../home/screen/home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNotifier>(
      builder: (context, provider, child) {
        return Scaffold(
          body: IndexedStack(
            index: provider.selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2), // Shadow color
                  spreadRadius: 0.5, // Spread radius
                  blurRadius: 1, // Blur radius
                  offset: const Offset(0, -1), // Shadow offset
                ),
              ],
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: provider.selectedIndex == 0
                        ? Utils.showSvgPicture(
                            'home_unselect',
                            'icons',
                            height: Utils.scrHeight * 0.024,
                            width: Utils.scrHeight * 0.024,
                          )
                        : Utils.showSvgPicture('home', 'icons',
                            height: Utils.scrHeight * 0.024,
                            width: Utils.scrHeight * 0.024),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: provider.selectedIndex == 1
                        ? Utils.showSvgPicture(
                            'cast',
                            'icons',
                            height: Utils.scrHeight * 0.024,
                            width: Utils.scrHeight * 0.024,
                          )
                        : Utils.showSvgPicture('cast_unselect', 'icons',
                            height: Utils.scrHeight * 0.024,
                            width: Utils.scrHeight * 0.024),
                    label: 'Cast',
                  ),
                  BottomNavigationBarItem(
                    icon: provider.selectedIndex == 2
                        ? Utils.showSvgPicture(
                            'episodes',
                            'icons',
                            height: Utils.scrHeight * 0.024,
                            width: Utils.scrHeight * 0.024,
                          )
                        : Utils.showSvgPicture('episodes_unselect', 'icons',
                            height: Utils.scrHeight * 0.024,
                            width: Utils.scrHeight * 0.024),
                    label: 'Episodes',
                  ),
                  BottomNavigationBarItem(
                    icon: provider.selectedIndex == 3
                        ? Utils.showSvgPicture(
                            'locations',
                            'icons',
                            height: Utils.scrHeight * 0.024,
                            width: Utils.scrHeight * 0.024,
                          )
                        : Utils.showSvgPicture('locations_unselect', 'icons',
                            height: Utils.scrHeight * 0.024,
                            width: Utils.scrHeight * 0.024),
                    label: 'Locations',
                  ),
                ],
                selectedItemColor: const Color(0xff9DFE00),
                unselectedItemColor: const Color(0xffE3E3E3),
                backgroundColor: const Color(0xff191D29),
                useLegacyColorScheme: false,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: provider.selectedIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  provider.updateSelectedIndex(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const CastScreen(),
    const EpisodesScreen(),
    const LocationsScreen(),
  ];
}
