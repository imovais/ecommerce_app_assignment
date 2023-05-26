import 'package:flutter/material.dart';

class OfferBanner extends StatelessWidget {
  final Color bannerColor;
  final String? imagebanner;
  const OfferBanner({
    super.key,
    required this.bannerColor,
    this.imagebanner,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(imagebanner.toString())),
          color: bannerColor,
        ),
      ),
    );
  }
}
