import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final GetStorage _getStorage = GetStorage();
  final String storageKey = 'isDarkMode';

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() => _getStorage.read(storageKey) ?? false;

  void saveThemeMode(bool isDarkMode) =>
      _getStorage.write(storageKey, isDarkMode);

  void changeThemeMode() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    saveThemeMode(!isSavedDarkMode());
  }
}
