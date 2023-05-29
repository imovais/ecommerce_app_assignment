//----------------------TEXT FIELD WIDGET -------------------
import 'package:flutter/material.dart';

import '../utlls_app/consts.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final bool obstext;
  final bool isSuffix;
  final Icon? suffixIcon;
  final TextEditingController? mycontroller;
  const TextFieldWidget(
      {super.key,
      required this.title,
      this.mycontroller,
      this.hint,
      this.obstext = false,
      this.suffixIcon,
      this.isSuffix = false});

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
        SizedBox(
          height: 50,
          width: double.infinity,
          child: TextField(
            
            keyboardType: TextInputType.emailAddress,
            obscureText: obstext,
            controller: mycontroller,
            decoration: InputDecoration(
              
                suffixIcon: isSuffix == true
                    ? const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.remove_red_eye),
                      )
                    : null,
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
        ),
      ],
    );
  }
}
