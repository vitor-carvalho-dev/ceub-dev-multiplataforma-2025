import 'package:flutter/material.dart';
import 'package:projetofinal/screens/explore_page.dart';

class Home extends StatefulWidget {

  final Function(ThemeMode) onThemeModeChanged;
  const Home({super.key, required this.onThemeModeChanged});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  List<NavigationDestination> appDestination = [

    NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home", selectedIcon: Icon(Icons.home)),
    NavigationDestination(icon: Icon(Icons.list_outlined), label: "Pedidos", selectedIcon: Icon(Icons.list)),
    NavigationDestination(icon: Icon(Icons.person_outlined), label: "Conta", selectedIcon: Icon(Icons.person)),
  ];

  @override
  Widget build(BuildContext context) {

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 4,
        backgroundColor: Theme.of(context).colorScheme.surface,

        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {

              final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
              widget.onThemeModeChanged(newMode);
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: const [
          ExplorePage(),
          Center(child: Text("Home", style: TextStyle(fontSize: 32))),
          Center(child: Text("Pedidos", style: TextStyle(fontSize: 32))),
          Center(child: Text("Conta", style: TextStyle(fontSize: 32))),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        destinations: appDestination,
      ),
    );
  }
}