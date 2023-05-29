

// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static CollectionReference allproduct =
      FirebaseFirestore.instance.collection('allproduct');

//==================ADD PRODUCT IN FIREBASE CLOUD STORE ==================
  static Future<void> addProductOnDatabase(String productName,
      String productPrice, String imageUrl, bool isFavourite) async {
    await allproduct.add({
      'productName': productName,
      'productPrice': productPrice,
      'imageUrl': imageUrl,
      'isFavourite': isFavourite,
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
