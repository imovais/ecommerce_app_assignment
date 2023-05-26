// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app_assignment/screens_app/auth/register_screen.dart';
import 'package:ecommerce_app_assignment/screens_app/home_screen/home_screen.dart';
import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets_app/app_bar.dart';
import '../../widgets_app/blue_button.dart';
import '../../widgets_app/text_button.dart';
import '../../widgets_app/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustomized(title: 'Sign In'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.008,
              ),

              //=======-========= Text===============
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome back to Mega Mall',
                    style: TextStyle(fontSize: 25, fontFamily: bold),
                  ),
                  Text('Silahkan masukan data untuk login'),
                ],
              ),

              //==================TEXT FILED ==================

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldWidget(
                    mycontroller: emailcontroller,
                    title: 'Email/Phone',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    mycontroller: passwordcontroller,
                    title: 'Password',
                    isSuffix: true,
                    obstext: true,
                  ),
                ],
              ),

              // ------------------ BUTTON--------------
              AppButton(
                func: () {
                  setState(() {});
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailcontroller.text.toString(),
                          password: passwordcontroller.text.toString())
                      .then((value) => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ))
                          });
                },
              ),

              // -------------------BOTTOM TEXT BUTTON--------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonApp(
                      text: 'Forgot Password',
                      textColor: primaryColor,
                      onTab: () {}),
                  TextButtonApp(
                      text: 'Sign Up',
                      textColor: secondaryBlue,
                      onTab: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
