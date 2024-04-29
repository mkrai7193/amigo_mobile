import 'package:get/get.dart';

import '../controllers/sign_in_bot_controller.dart';

class SignInBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInBotController>(
      () => SignInBotController(),
    );
  }
}
