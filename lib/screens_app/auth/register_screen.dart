import 'package:ecommerce_app_assignment/screens_app/auth/login_screen.dart';
import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

import '../../widgets_app/app_bar.dart';
import '../../widgets_app/blue_button.dart';
import '../../widgets_app/text_button.dart';
import '../../widgets_app/text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                children: const [
                  TextFieldWidget(
                    title: 'Email/Phone',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    title: 'Email/Phone',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),

              // ------------------ BUTTON--------------
              const AppButton(),

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
