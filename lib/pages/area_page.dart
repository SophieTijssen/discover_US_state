import 'package:flutter/material.dart';

import '../design/area_card.dart';
import '../design/theme.dart';

class AreaPage extends StatelessWidget {
  const AreaPage({Key? key, required this.area}) : super(key: key);

  final AreaCard area;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // area.name,
          area.usState.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        backgroundColor: primaryColor,
      ),
      body: Row(
        children: <Widget>[
          const SizedBox(
            width: 10.0
          ),
          Column(
            children: <Widget>[
              const SizedBox(
                  height: 10.0
              ),
              SizedBox(
                width: 350.0,
                child: Text(
                  "Description:",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                width: 350.0,
                child: Text(
                    // area.description,
                    area.usState.description,
                    style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(
                width: 350.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Median age: ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "${area.usState.medianAge}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Median household income: ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "${area.usState.medianHouseholdIncome}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      "Median property value: ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "${area.usState.medianPropertyValue}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}