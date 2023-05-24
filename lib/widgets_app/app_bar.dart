  import 'package:flutter/material.dart';
import '../utlls_app/consts.dart';

AppBar appBarCustomized({required String title, bool leadingIcon = true }) {
    return AppBar(
      automaticallyImplyLeading: leadingIcon,
      foregroundColor: primaryColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(style: const TextStyle(fontFamily: bold), title),
    );
  }