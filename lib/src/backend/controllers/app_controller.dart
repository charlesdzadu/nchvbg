import 'package:get/get.dart';

import '../../../routes.dart';

class AppController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.offAllNamed(AppRoutes.home);
  }
}
