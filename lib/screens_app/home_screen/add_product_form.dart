// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_assignment/screens_app/home_screen/home_screen.dart';
import 'package:ecommerce_app_assignment/widgets_app/text_field.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  TextEditingController pname = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController reviews = TextEditingController();

  TextEditingController rating = TextEditingController();

  TextEditingController image = TextEditingController();

  TextEditingController listcategory = TextEditingController();

  Future<void> addProductOnDatabase(
      String productName,
      String productPrice,
      String productreviews,
      String productrating,
      String imageUrl,
      String listcategory) async {
    await FirebaseFirestore.instance.collection("allproducts").add({
      'productName': productName,
      'productPrice': productPrice,
      'ProductReviews': productreviews,
      'ProductRating': productrating,
      'imageUrl': imageUrl,
      'listcategory': listcategory,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Products')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWidget(
                title: 'Product Name',
                mycontroller: pname,
              ),
              TextFieldWidget(title: 'Price', mycontroller: price),
              TextFieldWidget(
                title: 'Reviews',
                mycontroller: reviews,
              ),
              TextFieldWidget(
                title: 'Rating',
                mycontroller: rating,
              ),
              TextFieldWidget(
                title: 'Image',
                mycontroller: image,
              ),
              TextFieldWidget(
                title: 'ListGategory',
                mycontroller: listcategory,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        addProductOnDatabase(
                                pname.text.toString(),
                                price.text.toString(),
                                reviews.text.toString(),
                                rating.text.toString(),
                                image.text.toString(),
                                listcategory.text.toString())
                            .whenComplete(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        });
                      },
                      child: Text('Save')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
