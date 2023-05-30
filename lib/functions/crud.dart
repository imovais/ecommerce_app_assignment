// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static CollectionReference allproduct =
      FirebaseFirestore.instance.collection('allproduct');

//==================ADD PRODUCT IN FIREBASE CLOUD STORE ==================
  static Future<void> addProductOnDatabase(
      String productName,
      String productPrice,
      String productreviews,
      String productrating,
      String imageUrl,
      bool feature,
      bool bestseller,
      bool newarrival,
      bool topratedproduct) async {
    await FirebaseFirestore.instance.collection("allproducts").add({
      'productName': productName,
      'productPrice': productPrice,
      'ProductReviews': 'Review$productreviews',
      'ProductRating': productrating,
      'imageUrl': imageUrl,
      'Category': {
        'Feature': feature,
        'Best Seller': bestseller,
        'New Arrival': newarrival,
        'topratedproduct': topratedproduct
      },
    });
  }

//==================DELET PRODUCT IN FIREBASE CLOUD STORE ==================
  static Future<void> deletProductOnDatabase(String documentid) async {
    try {
      await FirebaseFirestore.instance
          .collection('allproducts')
          .doc(documentid)
          .delete();

      print('Document deleted successfully.');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
}
