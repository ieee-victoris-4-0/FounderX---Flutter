// ignore_for_file: unused_catch_clause
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:founderx/core/Api/api_client.dart';
import 'package:founderx/core/constants/server.dart';
import 'package:founderx/core/exceptions/exceptions.dart';
class RemoteDataSource{
  final ApiClient apiClient;
  RemoteDataSource({required this.apiClient});
  Future<Map<String,dynamic>>  signInWithGoogle() async{
   final result= await apiClient.instance.get(EndPoints.loginWithGoogle);
   final url=result.data["data"]["url"];
   try{
    final resultX = await FlutterWebAuth2.authenticate(
    url: url.toString(),
    callbackUrlScheme: "com.example.app",
  );

  print("====================");
    final token = Uri.parse(resultX).queryParameters['token'];
    final id = Uri.parse(resultX).queryParameters['id'];
    final name = Uri.parse(resultX).queryParameters['name'];
    final email = Uri.parse(resultX).queryParameters['email'];
    if (token != null) {
      print("------------------>>>>>>>>>>>>>>>$token");
      return {
        "token":token,
        "id":id,
        "name":name,
        "email":email,
      };
      }
      else{
        throw ServerException();
      }
   }on DioException catch(e){
    throw ServerException();
   }
   catch(e){
    print(e.toString());
      if (e is PlatformException && e.code == 'CANCELED') {
        print("====================");
        print(e.code);
        print("====================");

    throw OtherLoginCancelException();
  } else {
    throw ServerException();
  }
   }
  }
  signInWithFacebook() async{}
   register(Map<String,dynamic> data) async{
    try{
      final result= await apiClient.instance.post(EndPoints.register,data: data);
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
  Future<Map<String,dynamic>> setpassword(Map<String,dynamic> data) async{
    try{
      final result= await apiClient.instance.post(EndPoints.setPassword,data: data);
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
   Future<Map<String,dynamic>> login(Map<String,dynamic> data) async{
    try{
      final result= await apiClient.instance.post(EndPoints.login,data: data);
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
   Future<Map<String,dynamic>> verify(Map<String,dynamic> data) async{
    try{
      final result= await apiClient.instance.post(EndPoints.verifyCode,data: data);
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