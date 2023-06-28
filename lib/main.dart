import 'package:flutter/material.dart';

import 'package:mysample/pages/search.dart';
import 'package:mysample/pages/table.dart';

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
      home: Scaffold(
        body: SafeArea(
          child: const [
            // Select pages as _currentPageIndex changes
            Center(
              child: Text('Home'),
            ),
            TimetableScreen(),
            SearchPage(),
            Center(
              child: Text('More'),
            )
          ][_currentPageIndex],
        ),
        floatingActionButton: _currentPageIndex == 1
            ? FloatingActionButton.extended(
                onPressed: () => null,
                icon: Icon(
                  Icons.add,
                ),
                label: const Text('Add Lecture'),
              )
            : null,
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
