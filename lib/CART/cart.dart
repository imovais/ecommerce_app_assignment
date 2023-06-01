// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_assignment/CART/MODEL/cart_model.dart';
import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  // final DocumentSnapshot? fromPDetaildata;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // void calculate(int amount) {
  //   totalamount2 + amount;
  // }
  List tt = [];
  checking(int amount, i) {
    tt.add([i, amount]);
    for (int hh in tt[1]) {
      totalamount2 = totalamount2 + hh;
    }
  }

  int totalamount2 = 0;
  @override
  Widget build(BuildContext context) {
    print('toal amount is $tt');
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        foregroundColor: primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: prefer_const_constructors
                Text('My Cart',
                    style: const TextStyle(
                        fontSize: 24, fontFamily: bold, color: primaryColor)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {});
                        totalamount2 = 0;
                        CartData.cartdatalist.clear();
                      },
                      child: const Text(' Remove All',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: bold,
                              color: secondaryLGrey))),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: CartData.cartdatalist.length,
                itemBuilder: (context, index) {
                  return CartListWidget(
                    pImage: CartData.cartdatalist[index]['productimage'],
                    pName: CartData.cartdatalist[index]['productname'],
                    pPrice: CartData.cartdatalist[index]['productprice'],
                    onpressget: (totalamount) {
                      setState(() {
                        checking(totalamount, index);
                      });
                    },
                  );
                },
                // Text(
                //     CartData.cartdatalist[index]['productname'].toString()),
              ),
            )

            // CartListWidget(
            //   onpressget: (totalamount) {
            //     totalamount2 = totalamount2 + totalamount;
            //     setState(() {});
            //     print('checking on click');
            //   },
            // ),
            // CartListWidget(
            //   onpressget: (totalamount) {
            //     setState(() {});
            //     totalamount2 = totalamount2 + totalamount;
            //     print('checking on click $totalamount and $totalamount2');
            //   },
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.grey.withOpacity(0.2),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                borderOnForeground: true,
                color: Colors.transparent,
                child: SizedBox(
                    width: 150,
                    height: kToolbarHeight,
                    child: Center(
                        child: Text(
                      'Rs. $totalamount2',
                      style: const TextStyle(fontSize: 20, fontFamily: medium),
                    ))),
              ),
            ),
            const Expanded(
              child: Material(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35)),
                color: primaryColor,
                child: SizedBox(
                    //width: 150,
                    height: kToolbarHeight,
                    child: Center(
                        child: Text(
                      'CheckOut',
                      style: TextStyle(
                          fontSize: 20, fontFamily: bold, color: primaryBG),
                    ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartListWidget extends StatefulWidget {
  const CartListWidget({
    super.key,
    required this.onpressget,
    required this.pName,
    required this.pPrice,
    required this.pImage,
  });
  final String pName;
  final String pPrice;
  final String pImage;

  final ValueSetter<int> onpressget;

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  //int totalamount = 0;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    int totalamount;
    // print(totalamount);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(
                  3,
                  2,
                ),
                color: Colors.grey.shade400,
                blurRadius: 4,
                blurStyle: BlurStyle.normal)
          ],
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Row(
        children: [
          Container(
              height: double.infinity,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage(widget.pImage)))),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.pName.toString(),
                  style: const TextStyle(
                      fontFamily: bold, fontSize: 16, color: primaryColor),
                ),
                Text('Total Rs. ${widget.pPrice}.'),
                const SizedBox(
                  height: 20,
                ),
                //===========Cart Button==========
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: primaryColor,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              quantity = quantity - 1;
                              totalamount = quantity * int.parse(widget.pPrice);
                              widget.onpressget(totalamount);
                            });
                          },
                          icon: const Icon(Icons.remove)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(fontSize: 20, fontFamily: regular),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: primaryColor,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              quantity = quantity + 1;
                              totalamount = quantity * int.parse(widget.pPrice);
                              widget.onpressget(totalamount);
                            });
                          },
                          icon: const Icon(Icons.add)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
