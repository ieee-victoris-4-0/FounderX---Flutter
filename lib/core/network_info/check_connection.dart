import 'package:internet_connection_checker/internet_connection_checker.dart';
class CheckConnection{
  final InternetConnectionChecker internetConnectionChecker;
  CheckConnection({required this.internetConnectionChecker});
  Future<bool> get isOnline async{
    final result=await internetConnectionChecker.hasConnection;
    return result;
  }
}