import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:marketi_app/api/api_consumer.dart';
import 'package:marketi_app/api/end_points.dart';
import 'package:marketi_app/core/errors/exceptions.dart';
import 'package:marketi_app/features/auth/data/signin_model.dart';
import 'package:marketi_app/features/auth/data/signup_model.dart';
import 'package:marketi_app/shared/cache_helper.dart';

class UserRepository{
  UserRepository({required this.api});

  final ApiConsumer api;

  Future<Either<SignInModel,String>?> signIn({required email,required password}) async {
    try{
      final response = await api.post(EndPoint.signIn,
      data: {
        ApiKey.email:email,
        ApiKey.password:password
      });
      final user = SignInModel.fromJson(response);
      final decodedToken =JwtDecoder.decode(user.token);
      CacheHelper.saveData(key: ApiKey.token, value: user.token);
      CacheHelper.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      if (kDebugMode) {
        print(decodedToken[ApiKey.id]);
      }
      return Left(user);
    }on ServerException catch(e){
      return Right(e.errorModel.error);
    }catch(e){
      if (kDebugMode) {
        print("Unexpected error");
      }
    }
    return null;
  }
  Future<Either<SignUpModel,String>?> signUp({
    required name,
    required phone,
    required email,
    required password,
    required confirmPassword
})async{
    try {
      final response = await api.post(
        EndPoint.signUp,
        data: {
          ApiKey.name:name,
          ApiKey.phone:phone,
          ApiKey.email:email,
          ApiKey.password:password,
          ApiKey.confirmPassword:password
        }
      );
      final signUpModel = SignUpModel.fromJsom(response);
      return Left(signUpModel);
    } on ServerException catch (e) {
      return Right(e.errorModel.error);
    }catch(e){
      if (kDebugMode) {
        print("Unexpected error");
      }
    }
    return null;
    

  }
}