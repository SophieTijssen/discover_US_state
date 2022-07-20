import 'package:discover_an_area/pages/discover_page.dart';
import 'package:discover_an_area/pages/favourites_page.dart';
import 'package:discover_an_area/pages/test_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design/app_data.dart';
import '../design/theme.dart';

class MyHomePage extends StatefulWidget {
  final int initialIndex;

  const MyHomePage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int navigationIndex;

  final List<Widget> _widgetOptions = <Widget>[
    const MyDiscoverPage(),
    const MyFavouritesPage(),
    const MyTestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    navigationIndex = Provider.of<AppData>(context, listen: true).getIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // 'GIVE THE APP A GODDAMN TITLE',
          'Discover and compare states',
          style: Theme.of(context).textTheme.headline3,
        ),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(navigationIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Compare',
          ),
        ],
        currentIndex: navigationIndex,
        selectedItemColor: primaryColor,
        onTap: (int index) {
          Provider.of<AppData>(context, listen: false).updateNavigationIndex(index);
          // setState(() {
          //   navigationIndex = index;
          // });
        }
      ),
    );
  }
}
