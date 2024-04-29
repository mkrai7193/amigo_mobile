import 'package:get/get.dart';

import '../controllers/select_group_type_controller.dart';

class SelectGroupTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectGroupTypeController>(
      () => SelectGroupTypeController(),
    );
  }
}
