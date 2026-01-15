import 'package:e_commerce/app/app_theme_data.dart';
import 'package:e_commerce/app/controller_binders.dart';
import 'package:e_commerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/splash_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:e_commerce/features/common/ui/screens/main_bottom_navbar_screen.dart';
import 'package:e_commerce/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinders(),
      routes: {
        '/' : (context) => const SplashScreen(),
        VerifyEmailScreen.name : (context) => const VerifyEmailScreen(),
        OtpVerificationScreen.name : (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name : (context) => const CompleteProfileScreen(),
        HomeScreen.name : (context) => const HomeScreen(),
        MainBottomNavbarScreen.name : (context) => const MainBottomNavbarScreen()
      },
    );
  }
}
