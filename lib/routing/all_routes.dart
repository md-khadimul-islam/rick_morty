import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/cast/screen/cast.dart';
import 'package:rick_and_morty/features/episodes/screen/episodes.dart';
import 'package:rick_and_morty/features/home/screen/widgets/cartoon_details.dart';
import 'package:rick_and_morty/features/home/screen/widgets/favourites.dart';
import 'package:rick_and_morty/features/locations/screen/locations.dart';

import '../features/bottom_navigation/screen/bottom.dart';
import '../features/home/screen/home.dart';

class Routes {
  static const String splash = "/splash";
  static const String home = "/home";
  static const String bottom = "/bottom";
  static const String location = "/location";
  static const String episodes = "/episodes";
  static const String details = "/details";
  static const String cast = "/cast";
  static const String favourite = "/favourite";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splash:
      //   return MaterialPageRoute(
      //     builder: (context) => const SplashScreen(),
      //   );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.favourite:
        return MaterialPageRoute(
          builder: (context) => const FavouritesScreen(),
        );
      case Routes.bottom:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        );
      case Routes.location:
        return MaterialPageRoute(
          builder: (context) => const LocationsScreen(),
        );
      case Routes.episodes:
        return MaterialPageRoute(
          builder: (context) => const EpisodesScreen(),
        );
      case Routes.cast:
        return MaterialPageRoute(
          builder: (context) => const CastScreen(),
        );
      case Routes.details:
        final nameImage = settings.arguments as CombineNameImage;
        return MaterialPageRoute(
          builder: (context) => CartoonDetailsScreen(
            nameImage: nameImage,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
