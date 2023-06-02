import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  //int totalamount2 = 0;

  @override
  Widget build(BuildContext context) {
    int totalamount2 = 0;
    print('toal amount is $totalamount2');
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: TextButton(
                      onPressed: () {},
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
            CartListWidget(
              onpressget: (totalamount) {
                totalamount = totalamount2;
                print('checking on click');
              },
            ),
            CartListWidget(
              onpressget: (totalamount) {
                totalamount2 = totalamount;
                print('checking on click $totalamount and $totalamount2');
              },
            ),
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
  });

  final ValueSetter<int> onpressget;

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  int totalamount = 0;
  int quantity = 1;

  int productprice = 2000;

  @override
  Widget build(BuildContext context) {
    print(totalamount);
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
                Text('Total Rs. $productprice.'),
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
                              totalamount = quantity * productprice;
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
                              totalamount = quantity * productprice;
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
