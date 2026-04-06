import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi_app/cubit/user_cubit.dart';
import 'package:marketi_app/features/auth/widgets/custom_button.dart';
import 'package:marketi_app/features/auth/widgets/custom_text_form_field.dart';
import 'package:marketi_app/features/auth/widgets/custom_widgets.dart';
import 'package:marketi_app/features/auth/widgets/new_password.dart';
import 'package:marketi_app/screens/congratulation_view.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return NewPassword(

        image: "assets/images/forgot_password1.png",
        text: "New password must be different from last password",
        newPassword: CustomTextFormField(
            label: "New Password",
            controller: UserCubit.get(context).newPassword,
            prefixIcon: Icon(Icons.lock_outline_rounded),
        isPassword: true,),
        confirmNewPassword: CustomTextFormField(
          label: "Confirm New Password",
          controller: UserCubit.get(context).confirmNewPassword,
          prefixIcon: Icon(Icons.lock_outline_rounded),
          isPassword: true,),
      customButton: CustomOutlinedButton(text: "Save Password",
      onPressed: (){
        navigateTo(context, CongratulationView());
      },),);
  }
}
