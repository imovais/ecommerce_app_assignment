//----------------------CUSTOMIZE APP BUTTON -------------------
import 'package:flutter/material.dart';

import '../utlls_app/consts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
            style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(secondaryBlue)),
            onPressed: () {},
            child: const Text(
              'Sign In',
              style: TextStyle(fontFamily: bold),
            )),
      ),
    );
  }
}