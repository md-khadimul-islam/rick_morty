import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/routing/all_routes.dart';
import 'package:rick_and_morty/services/provider_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    rotation();
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => MultiProvider(
        providers: providers,
        child: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {

          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Entur',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
              useMaterial3: true,
            ),
            initialRoute: Routes.bottom,
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        ),
      ),
    );
  }

  void rotation() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
