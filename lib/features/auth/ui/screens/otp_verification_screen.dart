import 'dart:async';

import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/app_constants.dart';
import 'package:e_commerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static const String name = '/otp-verification';
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}



class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeoutInSecs.obs;
  late Timer timer;
  RxBool _enableResendCodeButton = false.obs;

  @override
  void initState() {
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeoutInSecs;
   timer =  Timer.periodic(const Duration(seconds: 1), (t){
      _remainingTime.value--;
      if(_remainingTime.value == 0)
        {
          _enableResendCodeButton.value = true;
          t.cancel();
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80,),
                AppIconWidget(),
                const SizedBox(height: 16,),
                Text('Enter OTP Code', style: Theme.of(context).textTheme.titleLarge,),
                Text('A 4 Digit OTP Code has been sent', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),),
                const SizedBox(height: 24,),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  appContext: context,
                  keyboardType: TextInputType.number,
                  controller: _otpTEController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeFillColor: AppColors.themeColor,
                    inactiveColor: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                const SizedBox(height: 24,),
                ElevatedButton(
                    onPressed: (){
                      // if(_formKey.currentState!.validate())
                      //   {
                      //
                      //   }
                      Navigator.pushNamed(context, CompleteProfileScreen.name);
                    },
                    child: const Text("Next")
                ),
                const SizedBox(height: 24,),
                //TODO: Enable button when 120s is done and invisible the text
                // stream, timer(setstate), getx(obs)
                Obx(() => Visibility(
                  visible: !_enableResendCodeButton.value,
                  child: RichText(text: TextSpan(
                      text: 'This code will be expire in ',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                      children: [
                        TextSpan(text: '${_remainingTime}s', style: TextStyle(
                          color: AppColors.themeColor
                        ))
                      ]
                    )),
                ),
                ),
                Obx(() => Visibility(
                  visible: _enableResendCodeButton.value,
                  child: TextButton(onPressed: (){
                      _startResendCodeTimer();
                    }, child: const Text('Resend Code')
                    ),
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
    timer.cancel();
  }
}
