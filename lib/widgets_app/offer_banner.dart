import 'package:flutter/material.dart';

class OfferBanner extends StatelessWidget {
  final Color bannerColor;
  const OfferBanner({
    super.key,
    required this.bannerColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 150,
        color: bannerColor,
      ),
    );
  }
}
