import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/app_theme_data.dart';
import 'package:e_commerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/splash_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      routes: {
        '/' : (context) => const SplashScreen(),
        VerifyEmailScreen.name : (context) => const VerifyEmailScreen(),
        OtpVerificationScreen.name : (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name : (context) => const CompleteProfileScreen()
      },
    );
  }
}
