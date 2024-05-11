import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/ui/login/controller/login_controller.dart';
import 'package:faminity/ui/widgets/app_textfield.dart';
import 'package:faminity/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => LoginController());
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: 
      Padding(
        padding:  EdgeInsets.only(top: 50.h ,left: 20.w,right: 20.w,bottom: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          children: [
          Center(child: SvgPicture.asset('assets/images/testing.svg',height: Get.height*0.2,width: Get.height*0.5,color: AppColors.primary.withOpacity(0.6),)),
          SizedBox(height: 20.h,),
          Text('Welcome Back!',style: TextStyle(color: AppColors.primary,fontSize: 20.sp,fontWeight: FontWeight.w700,)),
          SizedBox(height: 20.h,),

          Form(
            key: controller.formKey,
            child: Column(
              children:[
                AppTextField(
                  controller: controller.emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h,),
                AppTextField(
                  controller: controller.passwordController,
                  labelText: 'Password',
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  //suffixIcon: true,
          
                ),
                SizedBox(height: 50.h,),
                RoundedElevatedButton(buttonText: 'Login' , onPressed: () { 

                  controller.login();
                 }, isEnabled: true,)
              ]
            ),
          
          
          ),
        ],),
      )
      
      )
    );
  }
}