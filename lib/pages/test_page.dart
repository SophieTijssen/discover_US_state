import 'package:discover_an_area/design/app_data.dart';
import 'package:discover_an_area/state_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import '../design/base_card.dart';
import '../design/theme.dart';
import 'comparison_result_page.dart';

class MyTestPage extends StatefulWidget {
  const MyTestPage({Key? key}) : super(key: key);

  @override
  State<MyTestPage> createState() => _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage> {
  // final _state1 = TextEditingController();
  // final _state2 = TextEditingController();
  USState? _state1;
  USState? _state2;
  // USState _state1 = data[0];
  // USState _state2 = data[1];

  List<DropdownMenuItem<USState>> getMenuItems() {
    List<DropdownMenuItem<USState>> dropDownMenuList = [];
    for (int i=0; i < data.length; i++) {
      DropdownMenuItem<USState> menuItem = DropdownMenuItem<USState>(child: Text(data[i].name, style: const TextStyle(fontSize: 18.0)), value: data[i]);
      dropDownMenuList.add(menuItem);
    }
    return dropDownMenuList;
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<USState>> menuItems = getMenuItems();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Compare states:',
            //     style: Theme.of(context).textTheme.headline2,
            //   ),
            // ),
            BaseCard(
              theColor: background,
              theChild: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 102.0,
                    child: Text(
                      'State 1:',
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  const SizedBox(
                    width: 35.0,
                  ),
                  SizedBox(
                    width: 222.0,
                    child: DropdownButton(
                      items: menuItems,
                      hint: const Text(
                        'State name',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      value: _state1,
                      onChanged: (USState? selectedState) {
                        setState(() {
                          _state1 = selectedState;
                        });
                      },
                      iconEnabledColor: primaryColor,
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
            ),
            BaseCard(
              theColor: background,
              theChild: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 102.0,
                    child: Text(
                      'State 2:',
                      style: TextStyle(fontSize: 21),
                    ),
                  ),
                  const SizedBox(
                    width: 35.0,
                  ),
                  SizedBox(
                    width: 222.0,
                    child: DropdownButton(
                      items: menuItems,
                      hint: const Text(
                        'State name',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      value: _state2,
                      onChanged: (USState? selectedState) {
                        setState(() {
                          _state2 = selectedState;
                        });
                      },
                      iconEnabledColor: primaryColor,
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
            ),
            // TextField(
            //   controller: _state1,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(
            //         borderSide: BorderSide(width: 2),
            //         borderRadius: BorderRadius.all(
            //             Radius.circular(25.0)
            //         )
            //     ),
            //     hintText: 'State #1',
            //   ),
            //   keyboardType: TextInputType.text,
            //   inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
            //   style: const TextStyle(fontSize: 20),
            // ),
            // TextField(
            //   controller: _state2,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(
            //         borderSide: BorderSide(width: 2),
            //         borderRadius: BorderRadius.all(
            //             Radius.circular(25.0)
            //         )
            //     ),
            //     hintText: 'State #2',
            //   ),
            //   keyboardType: TextInputType.text,
            //   inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
            //   style: const TextStyle(fontSize: 20),
            // ),
            BaseCard(
              theColor: primaryColor,
              theChild: const SizedBox(
                width: 110.0,
                height: 40.0,
                child: Center(
                  child: Text(
                    "Compare",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              theOnTapFunc: () {
                print("Comparing ${_state1?.name} and ${_state2?.name}...");
                if (_state1 != null && _state2 != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComparisonResultPage(state1: _state1 as USState, state2: _state2 as USState),
                      )
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
