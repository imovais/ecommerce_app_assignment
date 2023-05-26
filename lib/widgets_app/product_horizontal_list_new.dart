// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../utlls_app/consts.dart';

class ProductScrollerNew extends StatelessWidget {
  final String topTitle;
  final String topLinkText;
  final String image;
  final String pName;
  final String pPrice;
  final String pReview;
  final String listcat;

  const ProductScrollerNew(
      {super.key,
      this.topTitle = 'Featured Product',
      this.topLinkText = 'View All',
      this.image = p1,
      this.pName = 'TMA-2 HD Wireless',
      this.pPrice = 'Rp. 1.500.000',
      this.pReview = '86',
      required this.listcat});

  //  CollectionReference allproducts =
  //     FirebaseFirestore.instance.collection('allproducts');

 

  getallproducts({required String listcategory}) async {
    return 
        FirebaseFirestore.instance.collection('allproducts').where('listcategory', isEqualTo: listcategory.toString())
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getallproducts(listcategory: listcat),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: 240,
              color: primaryBG,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return TileApp(
                    price: snapshot.data.docs[index]['productPrice'].toString(),
                    name: snapshot.data.docs[index]['productName'].toString(),
                    myimage: snapshot.data.docs[index]['imageUrl'].toString(),
                    rating:
                        snapshot.data.docs[index]['ProductRating'].toString(),
                    review:
                        snapshot.data.docs[index]['ProductReviews'].toString(),
                  );
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

class TileApp extends StatelessWidget {
  final String name;
  final String myimage;
  final String price;
  final String rating;
  final String review;

  const TileApp(
      {super.key,
      required this.name,
      required this.myimage,
      required this.price,
      required this.rating,
      required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 3,
          child: Container(
              padding: const EdgeInsets.all(8.0),
              //height: 240,
              width: 148,
              color: widgetBG,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //====================IMAGES
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(myimage))),
                    //child: Image.asset(p1),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 14, color: primaryColor),
                      ),
                      Text(price,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontFamily: bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(size: 18, color: secondaryYellow, Icons.star),
                          Text(
                            rating,
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: bold,
                                color: primaryColor),
                          ),
                        ],
                      ),
                      Text(review,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: bold,
                              color: primaryColor)),
                      const Icon(Icons.more_vert)
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
