import 'dart:async';

import 'package:faminity/ui/admin/admin_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  late Timer timer;
  @override

  void onInit() {
    timer = Timer(const Duration(seconds: 3), navigateToLogin);
    super.onInit();
  }

  void navigateToLogin() {
    Get.offAll(() => const AdminPanel());
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}