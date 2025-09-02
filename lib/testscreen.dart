import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
            Color.fromRGBO(47, 229, 147, 1),
            Color.fromRGBO(114, 9, 183, 1)
          ])
        ),
        child: Center(
          child: Image.asset('assets/auth_feature/gif/success.gif',fit: BoxFit.cover,
          scale: 0.5,
          ),
        ),
      ),
    );
  }
}