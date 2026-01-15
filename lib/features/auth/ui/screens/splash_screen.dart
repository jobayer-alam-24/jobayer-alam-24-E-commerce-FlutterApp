import 'package:e_commerce/features/auth/ui/screens/verify_email_screen.dart';
import 'package:e_commerce/features/common/ui/controllers/main_bottom_navbar_controller.dart';
import 'package:e_commerce/features/common/ui/screens/main_bottom_navbar_screen.dart';
import 'package:e_commerce/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/app_icon_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, MainBottomNavbarScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              AppIconWidget(),
              const Spacer(),
              const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

