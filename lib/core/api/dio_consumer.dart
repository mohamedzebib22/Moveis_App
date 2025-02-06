import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_consumer.dart';
import 'package:movies_app/core/api/endpoint.dart';
import 'package:movies_app/core/errors/error_model.dart';
import 'package:movies_app/core/errors/server_exeptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    //dio.options.baseUrl = Endpoint.baseUrl;
    dio.options.validateStatus = (statusCode) {
      return statusCode! < 500;
    };
  }
  @override
  Future<Response> get(
    String baseUrl,
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      dio.options.baseUrl = baseUrl;
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);

      if (response is Response) {
        return response;
      } else {
        throw Exception("Response type mismatch");
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      }
      throw (e.message!);
    }
  }

  @override
  Future delete(String baseUrl, String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      dio.options.baseUrl = baseUrl;
      final response = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      }
      throw (e.message!);
    }
  }

  @override
  Future patch(String baseUrl, String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      dio.options.baseUrl = baseUrl;
      final response = await dio.patch(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      }
      throw (e.message!);
    }
  }

  @override
  Future<Response> post(String baseUrl, String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      dio.options.baseUrl = baseUrl;
      final response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        throw ServerExeptions(
            errorModel: ErrorModel.fromJson(e.response!.data));
      }
      throw (e.message!);
    }
  }
}
