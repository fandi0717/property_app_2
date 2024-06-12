import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/property_model.dart';

abstract class PropertyRemoteDataSource {
  Future<PropertyModel> getPropertysFromJson();
}

class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  PropertyRemoteDataSourceImpl();

  @override
  Future<PropertyModel> getPropertysFromJson() async {
    // load the json file
    final jsonString = await rootBundle.loadString('assets/api/property.json');

    // decode the json into list
    final Map<String, dynamic> jsonList = json.decode(jsonString);

    return PropertyModel.fromJson(jsonList);

    // convert list dynamic to list property model
    // return jsonList.entries.map(
    //   (e) {
    //     print("e key: ${e.key}");
    //     print("e val: ${e.value}");
    //     return PropertyModel.fromJson({e.key: e.value});
    //   },
    // ).toList();

    // return jsonList
    //     .map(
    //       (json) => PropertyModel.fromJson(json),
    //     )
    //     .toList();
  }
}
