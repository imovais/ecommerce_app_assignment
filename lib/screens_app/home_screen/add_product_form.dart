// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:ecommerce_app_assignment/functions/crud.dart';
import 'package:ecommerce_app_assignment/screens_app/home_screen/home_screen.dart';
import 'package:ecommerce_app_assignment/widgets_app/text_field.dart';
import 'package:flutter/material.dart';

import '../../functions/image_filepicker.dart';

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

  bool feature = false;
  bool bestseller = false;
  bool newarrival = false;
  bool topratedproduct = false;

  String? imagestore;
  // bool newArrival = false;
  // bool topRated = false;
  // bool specialOffers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Products')),
        body: Container(
          // Wrap the body in a Container
          width: double.infinity, // Set width to take the available space
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

                ElevatedButton(
                    onPressed: () => openFilePicker(imagestore!),
                    child: Text('Pick Image')),
                // TextFieldWidget(
                //   title: 'ListGategory',
                //   mycontroller: listcategory,
                // ),
                SizedBox(
                  height: 20,
                ),
                //====================CHECK BOX==============

                CheckboxListTile(
                  title: Text('Feature'),
                  value: feature,
                  onChanged: (value) {
                    setState(() {
                      feature = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Best Seller'),
                  value: bestseller,
                  onChanged: (value) {
                    setState(() {
                      bestseller = value!;
                    });
                  },
                ),

                CheckboxListTile(
                  title: Text('New Arrival'),
                  value: newarrival,
                  onChanged: (value) {
                    setState(() {
                      feature = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Top Rated Products'),
                  value: topratedproduct,
                  onChanged: (value) {
                    setState(() {
                      bestseller = value!;
                    });
                  },
                ),

                //====================END CHECK BOX=============
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
                          Product.addProductOnDatabase(
                                  pname.text.toString(),
                                  price.text.toString(),
                                  reviews.text.toString(),
                                  rating.text.toString(),
                                  imagestore.toString(),
                                  feature,
                                  bestseller)
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
        ));
  }
}
