

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addProductOnDatabase(
  String productName, 
  String productPrice,
  String imageUrl, 
  bool isFavourite) async {
  await FirebaseFirestore.instance.collection("allproducts").add({
    'productName': productName,
    'productPrice': productPrice,
    'imageUrl': imageUrl,
    'isFavourite': isFavourite,
  });
}