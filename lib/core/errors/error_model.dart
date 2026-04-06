import 'package:marketi_app/api/end_points.dart';

class ErrorModel{
  final String error;
  ErrorModel({required this.error});
   factory ErrorModel.fromJson(Map<String,dynamic>json){
     return ErrorModel(error: json[ApiKey.error]);
  }
}