import 'dart:convert';

USState stateFromJson(String str) => USState.fromJson(json.decode(str));
String stateToJson(USState data) => json.encode(data.toJson());

class USState {

  USState({
    required this.name,
    required this.id,
    required this.description,
    required this.medianAge,
    required this.medianHouseholdIncome,
    required this.medianPropertyValue,
  });

  String name;
  int id;
  String description;
  double medianAge;
  String medianHouseholdIncome;
  String medianPropertyValue;

  factory USState.fromJson(dynamic json) => USState(
      name: json["name"],
      id: json["id"],
      description: json["description"],
      medianAge: json["median_age"],
      medianHouseholdIncome: json["median_household_income"],
      medianPropertyValue: json["median_property_value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "description": description,
    "median_age": medianAge,
    "median_household_income": medianHouseholdIncome,
    "median_property_value": medianPropertyValue,
  };

}