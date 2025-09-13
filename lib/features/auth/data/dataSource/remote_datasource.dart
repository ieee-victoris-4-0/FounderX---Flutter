// ignore_for_file: unused_catch_clause
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:founderx/core/Api/api_client.dart';
import 'package:founderx/core/constants/server.dart';
import 'package:founderx/core/exceptions/exceptions.dart';
import 'package:founderx/core/network_info/check_connection.dart';
class RemoteDataSource{
  final ApiClient apiClient;
  final CheckConnection checkConnection;
  RemoteDataSource({required this.apiClient , required this.checkConnection});
  Future<Map<String,dynamic>>  signInWithGoogle() async{
    if(await checkConnection.isOnline){
   final result= await apiClient.instance.get(EndPoints.loginWithGoogle);
   final url=result.data["data"]["url"];
   try{
    final resultX = await FlutterWebAuth2.authenticate(
    url: url.toString(),
    callbackUrlScheme: "com.example.app",
  );
    final token = Uri.parse(resultX).queryParameters['token'];
    if (token != null) {
      return {
        "token":token,
      };
      }
      else{
        throw ServerException();
      }
   }on DioException catch(e){
    throw ServerException();
   }on HttpException{
    throw ServerException();
   }
   catch(e){      if (e is PlatformException && e.code == 'CANCELED') {
        print("====================");
        print(e.code);
        print("====================");

    throw OtherLoginCancelException();
  } else {
    throw ServerException();
  }
   }

    }else{
      throw(
        NetworkException()
      );
    }
  }
  signInWithFacebook() async{}
   register(Map<String,dynamic> data) async{
    try{
      print(data);
      final result= await apiClient.instance.post(EndPoints.register,data: data);
      print(result.statusCode);
      if(result.statusCode==201){

        return result.data;
      }
      else{
        throw UserAlreadyFoundException();
      }
    }
    catch(e){
      print("---------------------------");
      print(e);
      throw ServerException();
    }

  }
  Future<Map<String,dynamic>> setpassword(Map<String,dynamic> data) async{
    try{
      print(data);
      print(data["user_id"].runtimeType);
      final result= await apiClient.instance.post(EndPoints.setPassword,data: data);
      print(result.statusCode);
      if(result.statusCode==200){
        return result.data;
      }
      else{
        throw ServerException();
      }
    }
    catch(e){
      print(e);
      throw ServerException();
    }

  }
   Future<Map<String,dynamic>> login(Map<String,dynamic> data) async{
    try{
      print(data);
      final result= await apiClient.instance.post(EndPoints.login,data: data);
      print(result.statusCode);
      if(result.statusCode==200){
        return result.data;
      }
      else{
        throw ServerException();
      }
    }on DioException catch(e){
      if(e.response?.statusCode==422){
        throw InvalidCredentialsException();
      }
      else{
        throw ServerException();
      }
    }
    catch(e){
      print(e.toString());
      throw ServerException();
    }

  }
   Future<Map<String,dynamic>> verify(Map<String,dynamic> data) async{
    try{
      print(data);
      final result= await apiClient.instance.post(EndPoints.verifyCode,data: data);
      print(result.statusCode);
      if(result.statusCode==200){
        return result.data;
      }
      else{
        throw ServerException();
      }
    }
    catch(e){
      print(e);
      throw ServerException();
    }

  }
  Future<Map<String,dynamic>> forgetPassword(Map<String,dynamic> data) async{
    try{
      final result= await apiClient.instance.post(EndPoints.forgotPassword,data: data);
      if(result.statusCode==200){
        return result.data;
      }
      else{
        throw ServerException();
      }
    }
    catch(e){
      throw ServerException();
    }

  }
}