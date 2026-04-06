import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:marketi_app/cubit/user_cubit.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../widgets/custom_widgets.dart';

class VerifyCode extends StatelessWidget {
   VerifyCode({super.key,
     required this.byPhone,
     required this.image,
     required this.text,
     required this.otp,
     required this.customButton,

   });
   bool byPhone;
   String image;
   String text;
   Widget otp;
   Widget customButton;


   @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.0272, top: height * 0.0469),
            child: Row(
              children: [
                FloatingActionButton(
                  mini: true,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: AppColors.borderColor)
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  child: Icon(Icons.arrow_back_ios_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Gap(width * 0.0213),
                Text("Verification Code"),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image,height: height*0.3152,),
              Gap(height * 0.02),
              SizedBox( width: width*0.7573,
                  child: Text(text, textAlign: TextAlign.center)),
              Gap(height * 0.03),
              otp,
              Gap(height * 0.02),
              customButton,
              Gap(height * 0.01),
              Text("00.00"),
              Gap(height * 0.01),
                TextButton(
                    onPressed: () {
                    },
                    child: Text("Resend Code",style: TextStyle(
                        color: Colors.black
                    ),),
                ),
            ],
          ),
        ],
      ),
    );
  },
);
  }
}
