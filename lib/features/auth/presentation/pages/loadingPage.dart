import 'package:flutter/material.dart';
import 'package:founderx/features/auth/data/dataSource/remote_datasource.dart';

import '../../../../core/Api/api_client.dart';

class SignUpLoadingPage extends StatefulWidget {
  const SignUpLoadingPage({super.key});

  @override
  State<SignUpLoadingPage> createState() => _SignUpLoadingPageState();
}

class _SignUpLoadingPageState extends State<SignUpLoadingPage> {
    loginWithGoogle() async{
        final RemoteDataSource dr=RemoteDataSource(apiClient: ApiClient());
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