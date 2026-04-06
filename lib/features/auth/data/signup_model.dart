import 'package:marketi_app/api/end_points.dart';

class SignUpModel{
  final String message;
  SignUpModel({required this.message});
  factory SignUpModel.fromJsom(Map<String,dynamic>json){
    return SignUpModel(message: json[ApiKey.message]);
  }
  Map<String,dynamic>toJson(){
    return {
      ApiKey.message:message
    };
  }
}