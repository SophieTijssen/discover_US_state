import 'package:flutter/material.dart';

import '../design/base_card.dart';
import '../design/theme.dart';
import 'home_page.dart';

class MyWelcomePage extends StatefulWidget {
  const MyWelcomePage({Key? key}) : super(key: key);

  @override
  State<MyWelcomePage> createState() => _MyWelcomePageState();
}

class _MyWelcomePageState extends State<MyWelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BaseCard(
              theColor: background,
              theChild: Text(
                'Welcome', // to\n[APP NAME]!',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
            BaseCard(
              theColor: background,
              theChild: Text(
                'Would you like to find out\nwhich state suits you best?',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
            BaseCard(
              theColor: primaryColor,
              theChild: SizedBox(
                width: 100.0,
                height: 80.0,
                child: Center(
                  child: Text(
                    "Take the Test",
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              theOnTapFunc: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyHomePage(initialIndex: 2),
                  ),
                );
              },
            ),
            BaseCard(
              theColor: background,
              theChild: Text(
                'or',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
            BaseCard(
              theColor: primaryColor,
              theChild: SizedBox(
                width: 100.0,
                height: 80.0,
                child: Center(
                  child: Text(
                    "Discover your Area",
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              theOnTapFunc: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyHomePage(initialIndex: 0),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
