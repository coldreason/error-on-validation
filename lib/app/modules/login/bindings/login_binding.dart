import 'package:get/get.dart';

import 'package:lbp_web/app/modules/login/controllers/auth_controller_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthControllerController>(
      () => AuthControllerController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
