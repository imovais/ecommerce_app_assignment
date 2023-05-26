// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../utlls_app/consts.dart';

class ProductScroller extends StatelessWidget {
  final String topTitle;
  final String topLinkText;
  final String image;
  final String pName;
  final String pPrice;
  final String pReview;

  const ProductScroller({
    super.key,
    this.topTitle = 'Featured Product',
    this.topLinkText = 'View All',
    this.image = p1,
    this.pName = 'TMA-2 HD Wireless',
    this.pPrice = 'Rp. 1.500.000',
    this.pReview = '86',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: widgetBG,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                topTitle,
                style: TextStyle(
                    color: primaryColor, fontFamily: medium, fontSize: 16),
              ),
              Text("View All",
                  style: TextStyle(color: secondaryBlue, fontFamily: medium)),
            ],
          ),
          Container(
            width: double.infinity,
            height: 240,
            color: primaryBG,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
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
                                decoration: const BoxDecoration(
                                    image:
                                        DecorationImage(image: AssetImage(p1))),
                                //child: Image.asset(p1),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'TMA-2 HD Wireless',
                                    style: TextStyle(
                                        fontSize: 14, color: primaryColor),
                                  ),
                                  Text('Rp. 1.500.000',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
                                          fontFamily: bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                          size: 18,
                                          color: secondaryYellow,
                                          Icons.star),
                                      Text(
                                        '4.6',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: bold,
                                            color: primaryColor),
                                      ),
                                    ],
                                  ),
                                  const Text('86 Reviews',
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
