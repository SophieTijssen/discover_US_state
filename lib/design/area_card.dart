import 'package:discover_an_area/design/theme.dart';
import 'package:discover_an_area/pages/area_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_model.dart';
import 'app_data.dart';

const Icon activeFavouriteIcon = Icon(Icons.favorite, color: Colors.pink, size: 28.0);
const Icon passiveFavouriteIcon = Icon(Icons.favorite_outline, color: Colors.grey, size: 28.0);

class AreaCard extends StatefulWidget {
  // const AreaCard({Key? key, required this.name, required this.description, this.location, this.theOnTapFunc}) : super(key: key);
  const AreaCard({Key? key, required this.usState, this.theOnTapFunc}) : super(key: key);

  final USState usState;
  final VoidCallback? theOnTapFunc;

  @override
  State<AreaCard> createState() => _AreaCardState();
}

class _AreaCardState extends State<AreaCard> {
  late final String name;
  late final String description;

  @override
  void initState() {
    super.initState();
    name = widget.usState.name;
    description = widget.usState.description;
  }

  late bool isFavourite;
  late Icon favouriteIcon;
  // late Icon favouriteIcon = isFavourite ? activeFavouriteIcon : passiveFavouriteIcon;

  void addToFavourites() {
    isFavourite = true;
    favouriteIcon = activeFavouriteIcon;
    // Provider.of<AppData>(context, listen: false).addToFavourites(widget);
    Provider.of<AppData>(context, listen: false).addToFavourites(widget.usState);
  }

  void removeFromFavourites() {
    isFavourite = false;
    favouriteIcon = passiveFavouriteIcon;
    // Provider.of<AppData>(context, listen: false).removeFromFavourites(widget);
    Provider.of<AppData>(context, listen: false).removeFromFavourites(widget.usState);
  }

  @override
  Widget build(BuildContext context) {
    // List<AreaCard> favourites = Provider.of<AppData>(context, listen: true).getFavourites;
    List<USState> favourites = Provider.of<AppData>(context, listen: true).getFavourites;

    // if (favourites.contains(widget)) {
    if (favourites.contains(widget.usState)) {
      isFavourite = true;
      favouriteIcon = activeFavouriteIcon;
    } else {
      isFavourite = false;
      favouriteIcon = passiveFavouriteIcon;
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AreaPage(area: widget),
        )
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 12.0,
                          left: 0.0,
                          child: Text(
                            // widget.name,
                            name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        // widget.location != null
                        // location != null
                        //   ? Positioned(
                        //     top: 0.0,
                        //     right: 50.0,
                        //     child: IconButton(
                        //       icon: Icon(
                        //         Icons.location_on,
                        //         size: 28.0,
                        //         color: primaryColor,
                        //       ),
                        //       tooltip: 'View location',
                        //       onPressed: () {
                        //         setState(() {
                        //           print('Clicked on the location');
                        //         });
                        //       },
                        //     ),
                        //   )
                        // : const SizedBox.shrink(),
                        Positioned(
                          top: 0.0,
                          right: 10.0,
                          child: IconButton(
                            icon: favouriteIcon,
                            tooltip: 'Add to favourites',
                            onPressed: () {
                              setState(() {
                                isFavourite ? removeFromFavourites() : addToFavourites();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0
            ),
            SizedBox(
              width: 350.0,
              child: Text(
                // widget.description,
                description,
                style: Theme.of(context).textTheme.bodyText2
              ),
            ),
            // widget.location != null
            //   ? BaseCard(
            //     theColor: primaryColor,
            //     theChild: Container(
            //       height: 40.0,
            //       width: 40.0,
            //       decoration: BoxDecoration(
            //         color: primaryColor,
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //       child: const Align(
            //         alignment: Alignment.centerRight,
            //         child: Icon(
            //           Icons.location_on,
            //           size: 25.0,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //     theOnTapFunc: () {
            //       print('Clicked on the location');
            //     },
            //   )
            //   : const SizedBox.shrink(),
          ],
        ),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
