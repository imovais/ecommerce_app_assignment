import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome back to Mega Mall',
              style: TextStyle(fontSize: 25, fontFamily: bold),
            ),
            Text('Silahkan masukan data untuk login'),
            TextFieldWidget(
              title: 'Email/Phone',
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------TEXT FIELD WIDGET -------------------
class TextFieldWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final bool obstext;
  final TextEditingController? controller;
  const TextFieldWidget({
    super.key,
    required this.title,
    this.controller,
    this.hint,
    this.obstext = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontFamily: medium),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          obscureText: obstext,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.remove_red_eye),
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                  fontSize: 14, color: secondaryLGrey, fontFamily: medium),
              fillColor: widgetBG,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryLGrey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      ],
    );
  }
}
