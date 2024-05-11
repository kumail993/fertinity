import 'dart:async';
import 'package:faminity/ui/admin/admin_screen.dart';
import 'package:faminity/ui/login/login_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController{

  late Timer timer;
  @override

  void onInit() async {
    startTimer();
    super.onInit();
  }
  void startTimer() async {
    timer = Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      if (isLoggedIn) {
        Get.offAll(() => const AdminPanel());
      } else {
        Get.offAll(() => const LoginView());
      }
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}