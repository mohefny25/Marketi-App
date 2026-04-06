import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi_app/cubit/user_cubit.dart';
import 'package:marketi_app/features/forgot_password/widgets/forgot_password.dart';
import 'package:marketi_app/features/verify_code/verify_code_by_phone.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_widgets.dart';

class ForgotPasswordByPhoneView extends StatelessWidget {
   ForgotPasswordByPhoneView({super.key});
  TextEditingController phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    UserCubit cubit =UserCubit.get(context);

    return Scaffold(
      body: ForgotPassword(byPhone: true,
          image: "assets/images/forgot_password1.png",
          text: "Please enter your phone number to receive a verification code",
          customTextFormField: CustomTextFormField(label: "Phone Number",

              keyboardType: TextInputType.phone,
              controller: cubit.signUpPhone,
              prefixIcon: Icon(Icons.phone_android)),

          customButton: CustomOutlinedButton(text: "Send Code",
            onPressed: (){
            navigateTo(context, VerifyCodeByPhone());
            },

          ),
          ),
    );
  }
}
