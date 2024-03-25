import 'package:flutter/material.dart';
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
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Entur',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: Routes.bottom,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
