import 'package:ecommerce_app_assignment/utlls_app/colors.dart';
import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: prefer_const_constructors
                Text('My Cart',
                    style: const TextStyle(
                        fontSize: 24, fontFamily: bold, color: primaryColor)),
                TextButton(
                    onPressed: () {},
                    child: const Text('REMOVE ALL',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: regular,
                            color: primaryColor)))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CartListWidget(),
            const CartListWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Material(
            color: Colors.grey.withOpacity(0.2),
            child: Container(
                width: 150,
                height: kToolbarHeight,
                child: const Center(
                    child: Text(
                  'Rs. 20000',
                  style: TextStyle(fontSize: 20, fontFamily: medium),
                ))),
          ),
          Expanded(
            child: Material(
              color: secondaryBlue,
              child: Container(
                  //width: 150,
                  height: kToolbarHeight,
                  child: const Center(
                      child: Text(
                    'CheckOut',
                    style: TextStyle(
                        fontSize: 20, fontFamily: bold, color: primaryBG),
                  ))),
            ),
          )
        ],
      ),
    );
  }
}

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                image: const DecorationImage(image: AssetImage(p2))),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Product Name Here',
                  style: TextStyle(
                      fontFamily: bold, fontSize: 16, color: primaryColor),
                ),
                const Text('Total Rs. 20,000'),
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
                          onPressed: () {},
                          icon: const Icon(Icons.remove)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      '3',
                      style: TextStyle(fontSize: 20, fontFamily: bold),
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
                          onPressed: () {},
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
