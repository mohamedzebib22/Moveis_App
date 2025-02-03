import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(String baseUrl,String path ,{dynamic data ,  Map<String,dynamic> queryParameters ,bool isFormData =false});
  Future<Response> post(String baseUrl,String path ,{dynamic data ,  Map<String,dynamic> queryParameters ,bool isFormData =false});
  Future<dynamic> patch(String baseUrl,String path ,{dynamic data ,  Map<String,dynamic> queryParameters,bool isFormData=false});
  Future<dynamic> delete(String baseUrl,String path ,{dynamic data ,  Map<String,dynamic> queryParameters , bool isFormData=false});
}