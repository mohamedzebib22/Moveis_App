import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/errors/error_model.dart';
import 'package:movies_app/core/errors/server_exeptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl = Endpoint.baseUrl;
  }
  @override
  Future get(String path, {data,
   Map<String, dynamic>? queryParameters ,
   bool isFormData =false
   }) async{
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExeptions(e);
    }
  }

  @override
  Future delete(String path,
      {data, Map<String, 
      dynamic>? queryParameters,
      bool isFormData =false
      } ) async {
    try {
      final response =
          await dio.delete(path, data:isFormData ? FormData.fromMap(data): data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExeptions(e);
    }
  }

  @override
  Future patch(String path, {data, 
  Map<String, dynamic>? queryParameters,
  bool isFormData =false
  }) async{
     try {
      final response =
          await dio.patch(path, data: isFormData ? FormData.fromMap(data): data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExeptions(e);
    }
  }

  @override
  Future post(String path, {data, 
  Map<String, dynamic>? queryParameters,
  bool isFormData =false
  })async {
      try {
      final response =
          await dio.post(path, data: isFormData ? FormData.fromMap(data): data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExeptions(e);
    }
  }
}
