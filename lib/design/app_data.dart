import 'package:discover_an_area/data.dart';
import 'package:discover_an_area/state_model.dart';
import 'package:flutter/cupertino.dart';

// List<USState> data = <USState>[
//   USState(
//     name: 'California',
//     description: 'California is a state in the Western United States. With nearly 39.2 million residents across a total area of approximately 163,696 square miles (423,970 km2), it is the most populous and the third-largest U.S. state by area.',
//   ),
//   USState(
//     name: 'Florida',
//     description: 'Florida is a state located in the Southeastern region of the United States. Spanning 65,758 square miles (170,310 km2), Florida ranks 22nd in area among the 50 states, and with a population of over 21 million, is the third-most populous.',
//   ),
//   USState(
//     name: 'Louisiana',
//     description: 'Louisiana is a state in the Deep South and South Central regions of the United States. It is the 20th-smallest by area and the 25th most populous of the 50 U.S. states.',
//     // location: 'Deep South',
//   ),
//   USState(
//     name: 'Texas',
//     description: 'Texas is a state in the South Central region of the United States. At 268,596 square miles (695,662 km2), and with more than 29.1 million residents in 2020, it is the second-largest U.S. state by both area and population.',
//   ),
// ];

List<USState> data = rawData;

class AppData with ChangeNotifier {
  int navigationIndex = 0;
  // List<AreaCard> favourites = <AreaCard>[];
  List<USState> favourites = <USState>[];
  // late List<AreaCard> searchResults = data;
  late List<USState> searchResults = data;

  void updateNavigationIndex(int newIndex) {
    navigationIndex = newIndex;
    notifyListeners();
  }

  // void updateSearchString(String query) {
  //   searchString = query;
  //   notifyListeners();
  // }

  void initialiseSearchResults() {
    searchResults = data;
    notifyListeners();
  }

  // void addToFavourites(AreaCard area) {
  void addToFavourites(USState area) {
    favourites.add(area);
    notifyListeners();
  }

  // void removeFromFavourites(AreaCard area) {
  void removeFromFavourites(USState area) {
    favourites.remove(area);
    notifyListeners();
  }

  // void updateSearchResults(List<AreaCard> results) {
  void updateSearchResults(List<USState> results) {
    searchResults = results;
    notifyListeners();
  }

  int get getIndex => navigationIndex;
  // int get getSearchString => searchString;
  // List<AreaCard> get getData => data;
  List<USState> get getData => data;
  // List<AreaCard> get getFavourites => favourites;
  List<USState> get getFavourites => favourites;
  // List<AreaCard> get getSearchResults => searchResults;
  List<USState> get getSearchResults => searchResults;

}