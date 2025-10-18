import 'package:apprestaurant/home.dart';
import 'package:apprestaurant/models/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppRestaurant());
}

class AppRestaurant extends StatefulWidget {
  const AppRestaurant({super.key});

  @override
  State<AppRestaurant> createState() => _AppRestaurantState();
}

class _AppRestaurantState extends State<AppRestaurant> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yummy",
      debugShowCheckedModeBanner: false, //tirar a flag da tela debug
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}
