import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/api/dio_consumer.dart';
import 'package:marketi_app/cubit/user_cubit.dart';
import 'package:marketi_app/features/auth/view/signin_view.dart';
import 'package:marketi_app/repositories/user_repository.dart';
import 'package:marketi_app/features/home/home_view.dart';
import 'package:marketi_app/features/on_boarding/on_boarding_view.dart';
import 'package:marketi_app/features/splash/splash_view.dart';
import 'package:marketi_app/shared/cache_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //height of Figma App 812
  //width of Figma App 375

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final hasSeenOnBoarding =  CacheHelper.getData( key: 'hasSeenOnBoarding')??false;
    final signedIn = CacheHelper.getData(key: 'signedIn')??false;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
      ),

      child: BlocProvider(
        create: (context) => UserCubit(userRepository: UserRepository(api: DioConsumer(dio: Dio()))),
        child: MaterialApp(
      
      
        theme: ThemeData(
      
          scaffoldBackgroundColor: Colors.white,
              appBarTheme:AppBarTheme(
                toolbarHeight: height*0.0741,
      
                color: Colors.white
              )
        ),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home:signedIn?HomeView():
        hasSeenOnBoarding?
        SigninView():
        OnBoardingView(),
      ),
      ),
    );
  }
}