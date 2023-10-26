import 'package:hive_flutter/adapters.dart';
import 'package:Inova/helpers/hive_helper.dart';
import 'configs/constants/hive.dart';

class Inits {
  static Future initHive() async {
    //TODO
    await Hive.initFlutter();
    // Hive.registerAdapter(UserModelAdapter());
    await HiveHelper(HiveConstants.series).openBox();
  }
}
