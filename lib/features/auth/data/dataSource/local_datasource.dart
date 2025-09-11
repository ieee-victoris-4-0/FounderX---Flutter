import 'dart:convert';

import 'package:founderx/core/exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatasource {
  final SharedPreferences prefs ;
  LocalDatasource({required this.prefs});
  Future<bool> setUserData(String id, Map<String,dynamic> data) async{
    final result= await prefs.setString(id,data.toString());
    if(!result){
      throw SharedPreferenceException();
    }
    return result;
  }
  Future<bool> deleteUserData(String id) async{
    final result= await prefs.remove(id);
    if(!result){
      throw SharedPreferenceException();
    }    
    return result;
  }
  Future<Map<String,dynamic>> getUserData(String id) async{
    final result= prefs.getString(id);
    if(result==null){
      throw SharedPreferenceException();
    }
    return jsonDecode(result);
  }
}