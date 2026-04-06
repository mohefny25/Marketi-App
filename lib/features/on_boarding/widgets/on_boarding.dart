import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi_app/features/auth/view/signin_view.dart';


import '../../../core/constants/app_colors.dart';
import '../../../shared/cache_helper.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_widgets.dart';

class CustomOnBoarding extends StatelessWidget {
   CustomOnBoarding({super.key,
     required this.image,
     required this.dotImage,
     required this.headerText,
     required this.bodyText,
     required this.buttonText,
     required this.pageNum,
     required this.onPressed
   });
  String image;
   String dotImage;
   String headerText;
   String bodyText;
   String buttonText;
   int pageNum;
   VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: width*0.0373,
                top: width*0.0773,
              ),
              child: Container(
                height: height*0.057,
                width: width*0.1466,
                decoration: BoxDecoration(

                ),
                child: FloatingActionButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: AppColors.borderColor
                        )

                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryColor,
                    child: Text("skip"),

                    onPressed: () async {
                      //
                      await CacheHelper.saveData( key: 'hasSeenOnBoarding', value: true);
                      navigateToAndReplace(context, SigninView());
                    }),
              ),
            ),
          ),
          Spacer(),
          Image.asset(image,
            height: height*0.3152,
          width: width*0.9173,),
          Gap(height*0.030),
          Image.asset(dotImage,
          height: height*0.0533,
          width: width*0.16,),
          Gap(height*0.030),
          Text(headerText,style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),),
          Gap(height*0.030),
          SizedBox(
            width:pageNum==3?width*0.8293:(pageNum==1? width*0.5546:width*0.8506),
            child: Text(bodyText,
              textAlign: TextAlign.center,
              style: TextStyle(

              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),),
          ),
          Gap(height*0.050),
          CustomOutlinedButton(text: buttonText,onPressed: onPressed,),
          Gap(height*0.060),




        ],
      );

  }
}
