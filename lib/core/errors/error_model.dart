import 'package:movies_app/core/api/endpoint.dart';

class ErrorModel {
  final int statusCode;
  final String message;

  ErrorModel({required this.statusCode, required this.message});
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData){
    return ErrorModel(
      statusCode: jsonData['statusCode'],
     message: jsonData['message']);
  }
}