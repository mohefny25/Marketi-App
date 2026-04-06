import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi_app/features/forgot_password/widgets/forgot_password.dart';
import 'package:marketi_app/features/verify_code/verify_code_by_email.dart';

import '../../cubit/user_cubit.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_widgets.dart';



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
