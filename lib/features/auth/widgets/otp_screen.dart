import 'package:flutter/material.dart';
import 'package:marketi_app/core/constants/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: width*0.7466,
      height: height*0.0788,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.borderColor),
      ),
    );

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.128),
      child: Pinput(
        length: 4,
        controller: _pinController,
        focusNode: _pinFocusNode,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: Colors.grey.shade100,
          ),
        ),
        separatorBuilder: (index) =>  SizedBox(width: width*0.021),

        // الإعدادات الخاصة بالـ AutoFill على Android
        // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,  // أو .smsRetrieverApi
        // listenForMultipleSmsOnAndroid: true,

        onCompleted: (pin) {
          print("The code is : $pin");
          // هنا أرسل الكود للـ backend
        },
        keyboardType: TextInputType.number,
      ),
    );
  }
}