import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const DarkApp());
}


class DarkApp extends StatefulWidget {
  const DarkApp({super.key});

  @override
  State<DarkApp> createState() => _MyAppState();
}

class _MyAppState extends State<DarkApp> {

  ThemeMode _themeMode = ThemeMode.system;

  void _changeThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modo Dark',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: _themeMode,

      home: Home(onThemeModeChanged: _changeThemeMode),
    );
  }
}