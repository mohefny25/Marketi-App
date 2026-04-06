import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_app/api/api_consumer.dart';
import 'package:marketi_app/api/end_points.dart';
import 'package:marketi_app/repositories/user_repository.dart';
import 'package:meta/meta.dart';

import '../shared/cache_helper.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userRepository}) : super(UserInitial());
  static UserCubit get(context)=>BlocProvider.of(context);

  UserRepository userRepository;
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpUsername = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  bool checkBox=false;
  signInCheckBox(){
    checkBox=!checkBox;
    emit(SignInCheckBoxState(checkBox!));
  }
  signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
        email: signInEmail.text,
        password: signInPassword.text);
    if(checkBox)CacheHelper.saveData(key: "signedIn", value: true);
    response?.fold(
            (signInModel)=>emit(SignInSuccess()),
        (errorMessage)=>emit(SignInFailure(error: errorMessage))
    );

  }
  signUp() async {
    emit(SignUPLoading());
    final response = await userRepository.signUp(
        name: signUpName.text,
        phone: signUpPhone.text,
        email: signUpEmail.text,
        password: signUpPassword.text,
        confirmPassword: signUpConfirmPassword.text
    );
    response?.fold(
        (signUpModel)=>emit(SignUPSuccess()),
            (errorMessage)=>emit(SignUPFailure(error: errorMessage))
    );
  }

}
