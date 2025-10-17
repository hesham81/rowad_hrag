import 'dart:developer';

import 'package:hive/hive.dart';

abstract class HiveHelper {
  static Future<bool> addToLocal(String name, List<Map<String, dynamic>> data) async {
    final exists = await hasLocalData(name);
    if (exists) return false;

    final box = await Hive.openBox(name);
    await box.put(name, data);
    return true;
  }

  static Future<List<Map<String, dynamic>>?> getFromLocal(String name) async {
    try {
      final box = await Hive.openBox(name);
      final data = box.get(name);
      return data as List<Map<String, dynamic>>?;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> hasLocalData(String name) async {
    try {
      final box = await Hive.openBox(name);
      log("IS Container Local Data ${box.containsKey(name)}");
      return box.containsKey(name);
    } catch (e) {
      return false;
    }
  }
}