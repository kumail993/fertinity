import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:faminity/ui/admin/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminPanel extends GetView<AdminController> {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());
    return  Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text('FARMINITY',style: globalTextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: AppColors.lightGrey),),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width*0.4,
            height: Get.height*0.4,
            //color: AppColors.customWhite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      )
      
      //  Stack(
      //   children: [
      //     Positioned.fill(child:

      //     Container(
      //     decoration: const BoxDecoration(
      //         image: DecorationImage(
      //             fit: BoxFit.cover,
      //             opacity: 0.3,
      //             image: AssetImage('assets/images/bg.png'))),
      //   ),
      //     // SvgPicture.asset('assets/images/backgroundimage.svg',
      //     // height: Get.height,
      //     // width: Get.width,
      //     // fit: BoxFit.fill,
      //     // ),
      //     ),
      //     Align(
      //       alignment: Alignment.center,

      //       child: Container(
      //       width: Get.width*0.4,
      //       height: Get.height*0.2,
      //       //color: AppColors.customWhite,
      //       decoration: BoxDecoration(
      //         color: AppColors.customWhite,
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //     ),),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 50),
      //       child: Align(
      //         alignment: Alignment.topCenter,
            
      //         child: Container(
      //         width: Get.width*0.4,
      //         height: Get.height*0.2,
      //         //color: AppColors.customWhite,
      //         decoration: BoxDecoration(
      //           color: AppColors.customWhite,
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //       ),),
      //     )
      //   ],
      // ),

    );
  }
}