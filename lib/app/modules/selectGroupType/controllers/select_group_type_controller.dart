import 'package:get/get.dart';

class SelectGroupTypeController extends GetxController {
  RxBool isPrivateGroupSelected = true.obs;

  @override
  void onInit() {
    getGroups();
    super.onInit();
  }

  void getGroups() {}
}
