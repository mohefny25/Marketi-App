import 'package:flutter/cupertino.dart';
import 'package:marketi_app/cubit/user_cubit.dart';
import 'package:marketi_app/features/new_password/new_passwoed_view.dart';
import 'package:marketi_app/features/verify_code/widgets/verify_code.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_widgets.dart';
import '../otp/otp_screen.dart';



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
