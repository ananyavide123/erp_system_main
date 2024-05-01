import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../main.dart';
import 'hive_model.dart';

class DetailsBox with AppConstants {
  static const String hiveBoxKey = AppConstants.hiveBoxKey;
  static const String detailBoxKey = AppConstants.detailBoxKey;
  late Box _detailsBoxKey;
  DetailsBox._() {
    _detailsBoxKey = Hive.box(hiveBoxKey);
  }
  static final DetailsBox _singleton = DetailsBox._();
  factory DetailsBox() => _singleton;

  ///for public use
  static DetailsBox get detailsBox => _singleton;

  ///save data to db
  set saveDetail(Details value) {
    _detailsBoxKey.put(detailBoxKey, value).catchError(
      (error, stack) {
        debugPrint("Hive notification sound saving error >>");
      },
    );
  }

  ///fetch data from db
  Details? get fetchDetails {
    late Details? value;
    try {
      value = _detailsBoxKey.get(detailBoxKey);
      debugPrint('data---------$value');
      return value;
    } catch (e) {
      debugPrint("Error: $e");
      return value;
    }
  }
}
