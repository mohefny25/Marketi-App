import 'package:flutter/cupertino.dart';
import 'package:marketi_app/cubit/user_cubit.dart';
import 'package:marketi_app/features/auth/widgets/custom_widgets.dart';
import 'package:marketi_app/screens/new_passwoed_view.dart';

import '../features/auth/widgets/custom_button.dart';
import '../features/auth/widgets/otp_screen.dart';
import '../features/auth/widgets/verify_code.dart';

class VerifyCodeByEmail extends StatelessWidget {
  const VerifyCodeByEmail({super.key});

  @override
  Widget build(BuildContext context) {
    UserCubit cubit =UserCubit.get(context);
    return VerifyCode(
        byPhone: true,
        image: "assets/images/verify_by_email.png",
        text: "Please enter the 4 digit code sent to:\n ${cubit.signUpEmail.text}  ",
        otp: OtpScreen(),
        customButton: CustomOutlinedButton(text: "Verify Code",
        onPressed: (){
          navigateTo(context, NewPasswordView());
        },));
  }
}
