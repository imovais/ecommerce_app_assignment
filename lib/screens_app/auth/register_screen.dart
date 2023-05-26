// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app_assignment/screens_app/auth/login_screen.dart';
import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets_app/app_bar.dart';
import '../../widgets_app/blue_button.dart';
import '../../widgets_app/text_button.dart';
import '../../widgets_app/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustomized(title: 'Sign Up'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 5,
              // ),

              //=======-========= Text===============
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Register Account',
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),

              // ------------------ BUTTON--------------
              AppButton(
                func: () {
                  setState(() {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailcontroller.text.toString(),
                        password: passwordcontroller.text.toString());
                  });
                },
              ),

              // -------------------BOTTOM TEXT BUTTON--------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an Account?',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: primaryColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButtonApp(
                      text: 'Sign In',
                      textColor: secondaryBlue,
                      onTab: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
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
