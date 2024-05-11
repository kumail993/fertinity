import 'package:faminity/services/authentication_services.dart';
import 'package:faminity/ui/admin/admin_screen.dart';
import 'package:faminity/ui/common/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  AuthenticationService auth = AuthenticationService();


  Future<void> login() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      bool loggedIn = await auth.login(email, password);
      if (loggedIn) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        showToast('Login Successful');
        Get.offAll(() => const AdminPanel());
      } else {
        showToast('Invalid Email or Password');
      }
  }

  

}