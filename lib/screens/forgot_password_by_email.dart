import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi_app/features/auth/widgets/custom_widgets.dart';
import 'package:marketi_app/screens/verify_code_by_email.dart';

import '../cubit/user_cubit.dart';
import '../features/auth/widgets/custom_button.dart';
import '../features/auth/widgets/custom_text_form_field.dart';
import '../features/auth/widgets/forgot_password.dart';

class ForgotPasswordByEmail extends StatelessWidget {
   ForgotPasswordByEmail({super.key});


  @override
  Widget build(BuildContext context) {
    UserCubit cubit =UserCubit.get(context);
    return ForgotPassword(byPhone: false,
        image: "assets/images/forgot_password2.png",
        text: "Please enter your email address to receive a verification code",
        customTextFormField: CustomTextFormField(
            label: "Email Address",
            keyboardType: TextInputType.emailAddress,
            controller: cubit.signUpEmail,
            prefixIcon: Icon(Icons.email_outlined)),
        customButton: CustomOutlinedButton(text: "Send Code",
          onPressed: (){
          navigateTo(context, VerifyCodeByEmail());
          },
        ));
  }
}
