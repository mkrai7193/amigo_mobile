import 'package:get/get.dart';

import '../controllers/choose_group_name_controller.dart';

class ChooseGroupNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseGroupNameController>(
      () => ChooseGroupNameController(),
    );
  }
}
