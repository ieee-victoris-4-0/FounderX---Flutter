import 'package:flutter/material.dart';
import 'package:founderx/features/auth/auth_di/auth_di.dart';
import 'package:founderx/features/auth/data/dataSource/remote_datasource.dart';


class SignUpLoadingPage extends StatefulWidget {
  const SignUpLoadingPage({super.key});

  @override
  State<SignUpLoadingPage> createState() => _SignUpLoadingPageState();
}

class _SignUpLoadingPageState extends State<SignUpLoadingPage> {
  final RemoteDataSource dr=sl<RemoteDataSource>();
    loginWithGoogle() async{
        
          await dr.signInWithGoogle();
    }
    @override
  void initState() {
    loginWithGoogle();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
        ),
      ),
    );
  }
}