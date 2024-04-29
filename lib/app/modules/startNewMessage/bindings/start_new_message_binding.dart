import 'package:get/get.dart';

import '../controllers/start_new_message_controller.dart';

class StartNewMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartNewMessageController>(
      () => StartNewMessageController(),
    );
  }
}
