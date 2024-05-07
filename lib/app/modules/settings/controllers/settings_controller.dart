import 'package:amigo/themes/theme_service.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isDarkTheme = false.obs;

  @override
  void onInit() {
    getTheme();
    super.onInit();
  }

  getTheme() {
    isDarkTheme.value = Get.isDarkMode;
  }

  void changeTheme(bool onChanged) {
    isDarkTheme.value = onChanged;
    ThemeService().changeThemeMode();
  }
}
