// import 'package:discover_an_area/design/search_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

import '../design/app_data.dart';
import '../design/base_card.dart';
import '../design/area_card.dart';
import '../design/theme.dart';
import '../state_model.dart';

class MyDiscoverPage extends StatefulWidget {
  const MyDiscoverPage({Key? key}) : super(key: key);

  @override
  State<MyDiscoverPage> createState() => _MyDiscoverPageState();
}

class _MyDiscoverPageState extends State<MyDiscoverPage> {
  final _searchString = TextEditingController();
  // String searchString = '';
  // late List<AreaCard> data;
  // late List<AreaCard> data = Provider.of<AppData>(context, listen: true).getData;
  // late List<AreaCard> searchResults;
  late List<USState> searchResults;

  @override
  void initState() {
    super.initState();
    // data = Provider.of<AppData>(context, listen: true).getData;
    searchResults = data;
    // searchResults = Provider.of<AppData>(context, listen: true).getData;
  }

  void searchArea(String query) {
    // List<AreaCard> data = Provider.of<AppData>(context, listen: true).getData;
    // List<AreaCard> results;
    List<USState> results;

    if (query.isEmpty) {
      results = data;
    } else {
      results = data.where((area) {
        final areaName = area.name.toLowerCase();
        final input = query.toLowerCase();
        return areaName.contains(input);
      }).toList();
    }

    // Provider.of<AppData>(context, listen: false).updateSearchResults(results);
    // searchResults = Provider.of<AppData>(context, listen: false).getSearchResults;
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    // searchArea(searchString);
    // List<AreaCard> searchResults = Provider.of<AppData>(context, listen: true).getSearchResults;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 390.0,
                height: 100.0,
                child: BaseCard(
                  theColor: background,
                  theChild:
                  // SearchWidget(
                  //   text: searchString,
                  //   onChanged: searchArea,
                  //   hintText: 'State Name'
                  // ),
                  // TextFormField(
                  //   controller: _searchString,
                  //   onChanged: searchArea,
                  //   decoration: InputDecoration(
                  //     hintText: "Search state",
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
                  //     focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  //     prefixIcon: const Icon(Icons.search),
                  //     suffixIcon: IconButton(
                  //       icon: const Icon(Icons.clear),
                  //       onPressed: () {
                  //         _searchString.text = '';
                  //         searchArea(_searchString.text);
                  //       },
                  //     ),
                  //   ),
                  // ),

                  Container(
                    height: 42,
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.black26),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: _searchString,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: iconColor,
                        ),
                        suffixIcon: _searchString.text.isNotEmpty
                          ? GestureDetector(
                            child: Icon(
                              Icons.close,
                              color: iconColor
                            ),
                            onTap: () {
                              _searchString.clear();
                              searchArea('');
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                          : null,
                        hintText: 'State name',
                        // hintStyle: style,
                        border: InputBorder.none,
                      ),
                      // style: style,
                      onChanged: searchArea,
                    ),
                  ),
                ),
              ),
              // BaseCard(
              //   theColor: primaryColor,
              //   theChild: SizedBox(
              //     width: 85.0,
              //     height: 40.0,
              //     child: Center(
              //       child: Text(
              //         "Search",
              //         style: Theme.of(context).textTheme.headline3,
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              //   theOnTapFunc: () {
              //     // setState(() {
              //       searchString = _searchString.text;
              //       searchArea(searchString);
              //     // });
              //   },
              // ),
              BaseCard(
                theColor: background,
                theChild: SizedBox(
                  height: 535,
                  width: 380.0,
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      // return searchResults[index];
                      return AreaCard(usState: searchResults[index]);
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
