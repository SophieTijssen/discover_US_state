import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'design/app_data.dart';
import 'pages/home_page.dart';
// import 'pages/welcome_page.dart';
import 'design/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discover the states',
      theme: theme,
      home: ChangeNotifierProvider(
        create: (context) => AppData(),
        child: const
        MyHomePage(initialIndex: 0)
      ),
    );
  }
}

