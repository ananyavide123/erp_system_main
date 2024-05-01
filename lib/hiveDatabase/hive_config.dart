import 'package:hive/hive.dart';

import 'hive_model.dart';
import '../main.dart';

class AppHiveConfig {
  AppHiveConfig._();

  static Future<void> init() async {
    Hive.registerAdapter(DetailsAdapter());

    await Future.wait([
      Hive.openBox(AppConstants.hiveBoxKey),
    ]);
  }
}