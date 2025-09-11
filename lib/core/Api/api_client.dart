import 'package:dio/dio.dart';
import 'package:founderx/core/constants/server.dart';

class ApiClient{
  static final ApiClient _instance = ApiClient._internal();
  late final Dio instance;
  ApiClient._internal(){
    instance=Dio(BaseOptions(
        baseUrl: ServerConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },

      ),);
  }
  factory ApiClient() => _instance;
}