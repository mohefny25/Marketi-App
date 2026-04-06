import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi_app/core/constants/app_colors.dart';
import 'package:marketi_app/cubit/user_cubit.dart';
import 'package:marketi_app/features/auth/view/signup_view.dart';
import 'package:marketi_app/features/forgot_password/forgot_pass_by_phone_view.dart';
import 'package:marketi_app/features/home/home_view.dart';
import 'package:marketi_app/shared/cache_helper.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/custom_widgets.dart';

class SigninView extends StatelessWidget {
   SigninView({super.key});
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    UserCubit cubit =UserCubit.get(context);
    return Scaffold(

      body:
      Form(
        key: formKey,
        child: Column(
          children: [
            Gap(height*0.0764),

            Image.asset("assets/images/logo.png",
              height: height*0.2857,
              width: width*0.7253,),
        
            CustomTextFormField(
              controller: cubit.signInEmail,
              label: 'Username or Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              }, prefixIcon: Icon(Icons.email_outlined),
            ),
            Gap(10),
            CustomTextFormField(
              label: 'Password',
              controller: cubit.signInPassword,
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
        
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              }, prefixIcon: Icon(Icons.lock_outline),
            ),
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.0586),
              child: Row(
                children: [
                  Checkbox(

                      value: cubit.checkBox,
                      onChanged: (value){
                        cubit.signInCheckBox();

                      }),
                  Text("Remember me"),
                  Spacer(),
                  TextButton(onPressed: (){
                    navigateTo(context, ForgotPasswordByPhoneView());
                  },
                      child: Text("Forgot Password?",style:
                      TextStyle(color: AppColors.primaryColor),)),
                ],
              ),
              
            ),
            Gap(10),
            CustomOutlinedButton(text: "Log In",
              onPressed: (){
              if(formKey.currentState!.validate()){
                cubit.signIn();
                navigateToAndReplace(context, HomeView());

              }
              },
            ),
            Gap(10),
            Text("Or Continue With"),
            Gap(7),
            Image.asset("assets/images/login_icons.jpg"),
            Gap(7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Are you new in Marketi"),
                
                GestureDetector(
                    onTap:(){navigateTo(context, SignupView());
                      },
                    child: Text(" register?",style:
                  TextStyle(
                    color: AppColors.primaryColor
                  ),)),
        
              ],
            )
        
        
        
        
          ],
        ),
      ),
    );
  },
);
  }
}
