import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';

class Congratulation extends StatelessWidget {
   Congratulation({super.key,
    required this.image,
     required this.headerText,
    required this.text,
    required this.customButton
  });


  String image;
  String headerText;
  String text;
  Widget customButton;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                side: BorderSide(color: AppColors.borderColor)
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image,height: height*0.3152,),
                Gap(height * 0.03),
                Text(headerText),
                Gap(height * 0.03),
                SizedBox( width: width*0.7573,
                    child: Text(text, textAlign: TextAlign.center)),
                Gap(height * 0.04),
                customButton,

              ],
            ),
          ),
        ],
      ),
    );
  }
}
