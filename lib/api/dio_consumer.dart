import 'package:dio/dio.dart';
import 'package:marketi_app/api/api_consumer.dart';
import 'package:marketi_app/api/api_interceptor.dart';
import 'package:marketi_app/api/end_points.dart';

import '../core/errors/exceptions.dart';


class DioConsumer extends ApiConsumer{
DioConsumer({required this.dio}){
dio.options.baseUrl=EndPoint.baseUrl;
dio.interceptors.add(ApiInterceptor());
dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true
));
}
  final Dio dio;

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters})async {
    try {
      final response =await dio.get(path,data: data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }

  }
  @override
  Future post(String path, {Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false})async {
    try {
      final response = await dio.post(path,data: data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }

  }

  @override
  Future patch(String path, {Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await dio.patch(path,data: data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
  @override
  Future delete(String path, {Object? data, Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await dio.delete(path,data: data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
  
}