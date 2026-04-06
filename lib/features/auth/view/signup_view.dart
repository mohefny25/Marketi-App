import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi_app/core/constants/app_colors.dart';
import 'package:marketi_app/cubit/user_cubit.dart';
import 'package:marketi_app/features/auth/view/signin_view.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/custom_widgets.dart';


class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    GlobalKey<FormState> formKey =GlobalKey<FormState>();
    return BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    UserCubit cubit=UserCubit.get(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(top: height*0.0755,left: width*0.072),
        child: Align(
          alignment: Alignment.topLeft,
          child: FloatingActionButton(
            mini: true,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(
                      color: AppColors.borderColor
                  )

              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: Icon(Icons.arrow_back_ios_sharp ,),

              onPressed: (){
                Navigator.pop(context);
              }),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Gap(25),
            Center(
              child: Image.asset("assets/images/logo.png",
                height: height*0.197,
              width: width*0.5012,),
            ),
            CustomTextFormField(label: "Full Name",
                keyboardType: TextInputType.name,
                controller: cubit.signUpName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;},
                prefixIcon: Icon(Icons.perm_contact_calendar_sharp)),
            Gap(7),
            CustomTextFormField(label: "Username",
                controller: cubit.signUpUsername,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;},
                prefixIcon: Icon(Icons.person)),
            Gap(7),
            CustomTextFormField(label: "Phone Number",
                controller: cubit.signUpPhone,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;},
                prefixIcon: Icon(Icons.phone_android)),
            Gap(7),
            CustomTextFormField(

                label: "Email",
                controller: cubit.signUpEmail,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;},
                prefixIcon: Icon(Icons.email_outlined)),
            Gap(7),
            CustomTextFormField(
              isPassword: true,
                label: "Password",

                controller: cubit.signUpPassword,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;},
                prefixIcon: Icon(Icons.lock_outline_rounded)),
            Gap(7),
            CustomTextFormField(
                isPassword: true,
                label: "Confirm Password",
                controller: cubit.signUpConfirmPassword,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;},
                prefixIcon:Icon(Icons.lock_outline_rounded)),
            Gap(10),
            CustomOutlinedButton(text: "Sign Up",
              onPressed: (){
                if(formKey.currentState!.validate()){
                  cubit.signUp();
                  navigateToAndReplace(context, SigninView());
                }
              },
            ),
            Gap(7),
            Text("Or Continue With"),
            Gap(7),
            Image.asset("assets/images/login_icons.jpg"),
            Gap(7),

          ],
        ),
      ),
    );
  },
);
  }
}
