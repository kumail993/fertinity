import 'package:faminity/aap/color_theme.dart';
import 'package:faminity/aap/text_style.dart';
import 'package:faminity/firebase_options.dart';
import 'package:faminity/ui/splash%20screen/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.macos,
);
  EasyLoading.init();
  EasyLoading.instance
    ..textStyle = globalTextStyle(fontSize: 12, color: Colors.white)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.primary
    ..radius = 12
    ..indicatorSize = 30
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..userInteractions = false
    ..displayDuration = const Duration(seconds: 1)
    ..dismissOnTap = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: false,
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetMaterialApp(
          title: 'FARMINITY',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          // darkTheme: ThemeData.dark().copyWith(
          //   primaryColor: AppColors.customBlack,
          //   //primarySwatch: AppColors.primarySwatch,
          // ),
          theme: ThemeData(
            primaryColor: AppColors.primary,
            primarySwatch: AppColors.primarySwatch,
            useMaterial3: true,
            cardColor: Colors.white,
            fontFamily: 'TT Commons',
            appBarTheme: AppBarTheme(
              color: AppColors.primary,
              elevation: 0,
              titleTextStyle: globalTextStyle(
                fontSize: 14.sp,
              ),
            ),
            scaffoldBackgroundColor: AppColors.customWhite,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.black,
                  displayColor: Colors.black,
                ),
          ),
          builder: EasyLoading.init(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}