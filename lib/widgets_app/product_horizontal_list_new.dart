// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_assignment/functions/crud.dart';
import 'package:flutter/material.dart';
import '../utlls_app/consts.dart';

class ProductScrollerNew extends StatefulWidget {
  final String topTitle;
  final String topLinkText;
  final String image;
  final String pName;
  final String pPrice;
  final String pReview;
  final String cat;

  const ProductScrollerNew(
      {super.key,
      this.topTitle = 'Featured Product',
      this.topLinkText = 'View All',
      this.image = p1,
      this.pName = 'TMA-2 HD Wireless',
      this.pPrice = 'Rp. 1.500.000',
      this.pReview = '86',
      required this.cat});

  @override
  State<ProductScrollerNew> createState() => _ProductScrollerNewState();
}

class _ProductScrollerNewState extends State<ProductScrollerNew> {
  //  CollectionReference allproducts =
  getallproducts() async {
    return FirebaseFirestore.instance
        .collection('allproducts')
        .where(
          widget.cat,
          isEqualTo: true,
        )
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.topTitle,
              style: TextStyle(
                  color: primaryColor, fontFamily: medium, fontSize: 16),
            ),
            Text("View All",
                style: TextStyle(color: secondaryBlue, fontFamily: medium)),
          ],
        ),
        FutureBuilder(
            future: getallproducts(),
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
                        onTTap: () {
                          setState(() {
                            Product.deletProductOnDatabase(
                                snapshot.data.docs[index].id.toString());
                          });
                        },
                        price: snapshot.data.docs[index]['productPrice']
                            .toString(),
                        name:
                            snapshot.data.docs[index]['productName'].toString(),
                        myimage:
                            snapshot.data.docs[index]['imageUrl'].toString(),
                        rating: snapshot.data.docs[index]['ProductRating']
                            .toString(),
                        review: snapshot.data.docs[index]['ProductReviews']
                            .toString(),
                      );
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ],
    );
  }
}

class TileApp extends StatefulWidget {
  final String name;
  final String myimage;
  final String price;
  final String rating;
  final String review;
  final void Function()? onTTap;

  const TileApp(
      {super.key,
      required this.name,
      required this.myimage,
      required this.price,
      required this.rating,
      required this.review,
      required this.onTTap});

  @override
  State<TileApp> createState() => _TileAppState();
}

class _TileAppState extends State<TileApp> {
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
                        image:
                            DecorationImage(image: AssetImage(widget.myimage))),
                    //child: Image.asset(p1),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(fontSize: 14, color: primaryColor),
                      ),
                      Text(widget.price,
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
                            widget.rating,
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: bold,
                                color: primaryColor),
                          ),
                        ],
                      ),
                      Text(widget.review,
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: bold,
                              color: primaryColor)),
                      GestureDetector(
                          onTap: widget.onTTap, child: const Icon(Icons.delete))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
