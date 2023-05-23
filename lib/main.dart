import 'package:ecommerce_app_assignment/screens_app/auth/login_screen.dart';
import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: regular, primaryColor: primaryColor),
        home: const LoginScreen());
  }
}
