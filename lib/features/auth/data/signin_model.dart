import 'dart:convert';

import 'package:marketi_app/api/end_points.dart';

class SignInModel{
final String message;
final String token;
final User user;
SignInModel({
  required this.message,
  required this.token,
  required this.user
});
factory SignInModel.fromJson(Map<String,dynamic>json){
  return SignInModel(
      message: json[ApiKey.message]??'',
      token: json[ApiKey.token]??'',
      user: json[ApiKey.user] !=null ?
          User.fromJson(json[ApiKey.user])
          :User.empty()
  );
}
Map<String,dynamic>toJson(){
  return{
    ApiKey.message:message,
    ApiKey.token:token,
    ApiKey.user:user.toJson()
  };
}
}
class User{
  final String name;
  final String phone;
  final String email;
  final String role;
  final String image;
  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.image
});
  factory User.empty() {
    return User(
      name: '',
      phone: '',
      email: '',
      role: '',
      image: '',
    );
  }
  factory User.fromJson(Map<String,dynamic>json){
    return User(
        name: json[ApiKey.name]??'',
        phone: json[ApiKey.phone]??'',
        email: json[ApiKey.email]??'',
        role: json[ApiKey.role]??'',
        image: json[ApiKey.image]??''
    );
  }
  Map<String,dynamic> toJson(){
    return {
      ApiKey.name:name,
      ApiKey.phone:phone,
      ApiKey.email:email,
      ApiKey.role:role,
      ApiKey.image:image,

    };
  }
}