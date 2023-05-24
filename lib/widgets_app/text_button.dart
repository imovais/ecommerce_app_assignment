import 'package:flutter/material.dart';

class TextButtonApp extends StatelessWidget {
  final String text;
  final Color textColor;
  final void Function()? onTab;
  const TextButtonApp({
    super.key,
    required this.text,
    required this.textColor,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTab,
        child: Text(text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w600)));
  }
}
