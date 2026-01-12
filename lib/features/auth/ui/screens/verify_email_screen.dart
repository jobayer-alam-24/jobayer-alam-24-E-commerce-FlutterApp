import 'package:e_commerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});
  static const String name = '/email-verification';
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                Text('Welcome Back', style: Theme.of(context).textTheme.titleLarge,),
                Text('Please enter your email address', style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),),
                const SizedBox(height: 24,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true)
                      {
                        return 'Enter your email address';
                      }
                    if(!EmailValidator.validate(value!))
                      {
                        return 'Enter a valid email address';
                      }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email Address'
                  ),
                ),
                const SizedBox(height: 24,),
                ElevatedButton(
                    onPressed: (){
                      // if(_formKey.currentState!.validate())
                      //   {
                      //
                      //   }
                      Navigator.pushNamed(context, OtpVerificationScreen.name);
                    },
                    child: const Text("Next")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
