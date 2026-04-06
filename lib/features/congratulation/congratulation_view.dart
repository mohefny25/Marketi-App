import 'package:flutter/cupertino.dart';
import 'package:marketi_app/features/auth/view/signin_view.dart';
import 'package:marketi_app/features/congratulation/widgets/congratulation.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_widgets.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Congratulation(image: "assets/images/congratulation.png",
        headerText: "Congratulations",
        text: "You have updated the password. please login again with your latest password",
        customButton: CustomOutlinedButton(text: "Log in",
        onPressed: (){
          navigateTo(context, SigninView());
        },));
  }
}
