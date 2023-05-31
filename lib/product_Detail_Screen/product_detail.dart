import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final DocumentSnapshot data;
  const ProductDetail({super.key, required this.data});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

//Center(child: Text(widget.data['productName'].toString())),

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(icBell),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset(icCart)
                ],
              ),
            )
          ],
          centerTitle: true,
          foregroundColor: primaryColor,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Product Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.data['imageUrl'].toString(),
                          ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.data['productName'],
                  style: const TextStyle(
                      fontFamily: bold, fontSize: 24, color: primaryColor),
                ),
                Text(
                  'RS. ${widget.data['productPrice']}.00',
                  style: const TextStyle(
                      fontFamily: bold, fontSize: 16, color: Colors.red),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: secondaryYellow,
                          ),
                          Text('3.5'),
                          SizedBox(
                            width: 20,
                          ),
                          Text('99 Reviews'),
                        ],
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        color: const Color(0xffEEFAF6),
                        child: const Text('Tersedia : 250'),
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(pp),
                              
                          //backgroundColor: Colors.green,
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'MUHAMMAD OVAIS KHAN',
                              style: TextStyle(
                                  fontFamily: medium,
                                  fontSize: 14,
                                  color: primaryColor),
                            ),
                            Text(
                              'Flutter Developer',
                              style: TextStyle(
                                  fontFamily: regular,
                                  fontSize: 12,
                                  color: primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_sharp)
                  ],
                ),
                Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.5,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Description Product',
                  style: TextStyle(
                      fontFamily: bold, fontSize: 16, color: primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                        ),
                        text:
                            'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers')),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            Material(
              color: secondaryYellow,
              child: InkWell(
                onTap: () {
                  //print('called on tap');
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: 100,
                  child: Center(
                      child: Icon(
                    Icons.favorite_rounded,
                    shadows: [
                      Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.black)
                    ],
                    size: 30,
                    color: Color.fromARGB(255, 245, 16, 0),
                  )
                      // Text(
                      //   'Click',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: secondaryBlue,
                child: InkWell(
                  onTap: () {
                    //print('called on tap');
                  },
                  child: SizedBox(
                    height: kToolbarHeight,
                    width: double.infinity,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          shadows: [
                            Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 4,
                                color: Colors.black)
                          ],
                          size: 30,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontFamily: regular,
                              fontSize: 20,
                              color: Color.fromARGB(255, 230, 230, 230)),
                        )
                      ],
                    )
                        // Text(
                        //   'Bottom Button',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
