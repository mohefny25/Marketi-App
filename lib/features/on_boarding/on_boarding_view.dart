import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marketi_app/features/on_boarding/widgets/on_boarding.dart';
import 'package:marketi_app/features/auth/widgets/custom_widgets.dart';
import 'package:marketi_app/screens/home_view.dart';
import 'package:marketi_app/shared/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingView extends StatefulWidget {
   OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController =PageController();
  int _currentPage=0;
  @override
  @override

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  void _nextPage()async{
    if(_currentPage <2){
      _pageController.nextPage(duration: Duration(milliseconds: 300),
          curve: Curves.bounceInOut);
    }else{
      if (kDebugMode) {
        print('Navigating to Home...');
      }

      await CacheHelper.saveData( key: 'hasSeenOnBoarding', value: true);
      if (kDebugMode) {
        print(' after setBool Navigating to Home...');
      }
      navigateToAndReplace(context, HomeView());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page){
          setState(() {
            _currentPage = page;
          });

        },
        children: [
          CustomOnBoarding(
            pageNum: 1,
              image: "assets/images/onboarding1.png",
              dotImage: "assets/images/dotImage1.png",
              headerText: "Welcome to Marketi",
              bodyText: "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
              buttonText: "Next",
              onPressed: _nextPage,),
          CustomOnBoarding(
              pageNum: 2,
              image: "assets/images/onboarding2.png",
              dotImage: "assets/images/dotImage2.png",
              headerText: "Easy to Buy",
              bodyText: "Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.",
              buttonText: "Next",
            onPressed: _nextPage,),
          CustomOnBoarding(
              pageNum: 3,
              image: "assets/images/onboarding3.png",
              dotImage: "assets/images/dotImage3.png",
              headerText: "Wonderful User Experience",
              bodyText: "Start exploring now and experience the convenience of online shopping at its best.",
              buttonText: "Get Start",
            onPressed: _nextPage,)

        ],
      ),
    );
  }
}
