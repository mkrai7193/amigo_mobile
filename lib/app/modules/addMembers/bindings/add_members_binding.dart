import 'package:get/get.dart';

import '../controllers/add_members_controller.dart';

class AddMembersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMembersController>(
      () => AddMembersController(),
    );
  }
}
