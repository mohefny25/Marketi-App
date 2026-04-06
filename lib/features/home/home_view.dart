import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marketi_app/features/auth/view/signin_view.dart';
import 'package:marketi_app/shared/cache_helper.dart';

import '../../widgets/custom_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: (){
              CacheHelper.saveData(key: "signedIn", value: false);
              navigateToAndReplace(context, SigninView());
            }, icon: Icon(Icons.logout)),
            IconButton(onPressed: (){

            }, icon: Icon(Icons.dark_mode)),

          ],
        ),
      ),

    );
  }
}
