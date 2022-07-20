import 'package:discover_an_area/state_model.dart';
import 'package:flutter/material.dart';

DataTable createComparisonTable(BuildContext context, USState state1, USState state2) {
  List<String> columns = ["", state1.name, state2.name];
  return DataTable(
    columns: getColumns(context, columns),
    rows: getRows(state1, state2),
    dataRowHeight: 70.0,
  );
}

List<DataColumn> getColumns(BuildContext context, List<String> columns) => columns
  .map((String column) => DataColumn(
    label: SizedBox(
      width: 100.0,
      child: Text(
        column,
        style: Theme.of(context).textTheme.headline2,
        softWrap: true,
      ),
    ),
  )).toList();

List<DataRow> getRows(USState state1, USState state2) {
  // return [
  //   DataRow(cells: getCells(["median age", "test", "test"])),
  //   DataRow(cells: getCells(["median household income", "test", "test"])),
  //   DataRow(cells: getCells(["median property value", "test", "test"])),
  // ];
  return [
    DataRow(cells: getCells(["median age", state1.medianAge, state2.medianAge])),
    DataRow(cells: getCells(["median household income", state1.medianHouseholdIncome, state2.medianHouseholdIncome])),
    DataRow(cells: getCells(["median property value", state1.medianPropertyValue, state2.medianPropertyValue])),
  ];
}

List<DataCell> getCells(List<dynamic> cells) => cells
    .map((data) => DataCell(
      SizedBox(
        width: 100.0,
        child: Text(
          '$data',
          style: const TextStyle(fontSize: 16),
          softWrap: true,
        )
      )
)).toList();
