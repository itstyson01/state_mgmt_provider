import 'package:flutter/material.dart';
import 'package:multiple_provider/provider/count_provider.dart';
import 'package:multiple_provider/provider/favourite_provider.dart';
import 'package:multiple_provider/provider/slider_provider.dart';
import 'package:multiple_provider/provider/theme_changer_provider.dart';
import 'package:multiple_provider/screens/dark_theme.dart';
import 'package:multiple_provider/screens/favourite/favourite_example.dart';
import 'package:multiple_provider/screens/favourite/favourite_example.dart';
import 'package:multiple_provider/screens/count_example.dart';
import 'package:multiple_provider/screens/slider_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger())
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.thememode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: const FavouriteExample(),
          );
        }));
  }
}
