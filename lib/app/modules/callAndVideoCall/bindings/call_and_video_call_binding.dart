import 'package:get/get.dart';

import '../controllers/call_and_video_call_controller.dart';

class CallAndVideoCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallAndVideoCallController>(
      () => CallAndVideoCallController(),
    );
  }
}
