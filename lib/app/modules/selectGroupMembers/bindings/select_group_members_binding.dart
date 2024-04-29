import 'package:get/get.dart';

import '../controllers/select_group_members_controller.dart';

class SelectGroupMembersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectGroupMembersController>(
      () => SelectGroupMembersController(),
    );
  }
}
