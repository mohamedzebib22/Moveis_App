import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(String path ,{dynamic data ,  Map<String,dynamic> queryParameters ,bool isFormData =false});
  Future<Response> post(String path ,{dynamic data ,  Map<String,dynamic> queryParameters ,bool isFormData =false});
  Future<dynamic> patch(String path ,{dynamic data ,  Map<String,dynamic> queryParameters,bool isFormData=false});
  Future<dynamic> delete(String path ,{dynamic data ,  Map<String,dynamic> queryParameters , bool isFormData=false});
}