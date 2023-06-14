import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: const [
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Timetable'),
          ),
          Center(
            child: Text('Search'),
          ),
          Center(
            child: Text('More'),
          )
        ][_currentPageIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentPageIndex,
          destinations: const <NavigationDestination>[
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.date_range), label: 'Timetable'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.menu), label: 'More'),
          ],
          onDestinationSelected: (value) {
            setState(() {
              _currentPageIndex = value;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        ),
      ),
    );
  }
}
