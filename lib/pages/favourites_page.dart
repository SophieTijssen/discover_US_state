import 'package:discover_an_area/state_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design/app_data.dart';
import '../design/area_card.dart';
import '../design/base_card.dart';
import '../design/theme.dart';

class MyFavouritesPage extends StatefulWidget {
  const MyFavouritesPage({Key? key}) : super(key: key);

  @override
  State<MyFavouritesPage> createState() => _MyFavouritesPageState();
}

class _MyFavouritesPageState extends State<MyFavouritesPage> {
  @override
  Widget build(BuildContext context) {
    // List<AreaCard> favourites = Provider.of<AppData>(context, listen: true).getFavourites;
    List<USState> favourites = Provider.of<AppData>(context, listen: true).getFavourites;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BaseCard(
              theColor: background,
              theChild: SizedBox(
                height: 618.0,
                width: 380.0,
                child: favourites.isEmpty
                  ? Text(
                      "You have no states added to your favourites.",
                      style: Theme.of(context).textTheme.bodyText2
                    )
                  : ListView.builder(
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    // return favourites[index];
                    return AreaCard(usState: favourites[index]);
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
