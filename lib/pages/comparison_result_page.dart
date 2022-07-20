import 'package:discover_an_area/state_model.dart';
import 'package:flutter/material.dart';

import '../create_comparison_table.dart';
// import '../design/area_card.dart';
import '../design/base_card.dart';
import '../design/theme.dart';

class ComparisonResultPage extends StatelessWidget {
  const ComparisonResultPage({Key? key, required this.state1, required this.state2}) : super(key: key);

  final USState state1;
  final USState state2;

  @override
  Widget build(BuildContext context) {
    DataTable comparisonTable = createComparisonTable(context, state1, state2);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // area.name,
          'Comparison result',
          style: Theme.of(context).textTheme.headline3,
        ),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BaseCard(
              theColor: background,
              theChild: Column(
                children: <Widget>[
                  SizedBox(
                    height: 500.0,
                    width: 380.0,
                    child: Center(
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: comparisonTable,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
