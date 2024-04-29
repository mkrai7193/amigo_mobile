import 'package:get/get.dart';

import '../controllers/upload_files_controller.dart';

class UploadFilesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadFilesController>(
      () => UploadFilesController(),
    );
  }
}
