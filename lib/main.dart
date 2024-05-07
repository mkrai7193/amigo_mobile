import 'package:amigo/apis/socket_manager.dart';
import 'package:amigo/app/modules/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'themes/theme_service.dart';
import 'themes/themes.dart';

void main() async {
  await SocketIOManager()
      .init('http://ec2-54-91-125-125.compute-1.amazonaws.com:9090');
  debugPrint(
      'Check if socket is connected ${SocketIOManager().isSocketConnected()}');
  runApp(const Amigo());
}

class Amigo extends StatelessWidget {
  const Amigo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Application',
      initialBinding: BindingsBuilder<dynamic>(() {
        Get.put(SplashController());
      }),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
