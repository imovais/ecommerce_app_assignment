// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

import '../../widgets_app/offer_banner.dart';
import '../../widgets_app/product_horizontal_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryBG,
        appBar: appBarHome(title: appname),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  decoration: InputDecoration(
                      fillColor: widgetBG,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: widgetBG),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: ImageIcon(AssetImage(icSearch))),
                ),
                const SizedBox(
                  height: 30,
                ),
                OfferBanner(bannerColor: Colors.green),
                const SizedBox(
                  height: 30,
                ),

                //================CATEGORY WIDGET====================
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Categories",
                          style: TextStyle(
                              color: primaryColor,
                              fontFamily: medium,
                              fontSize: 16),
                        ),
                        Text("View All",
                            style: TextStyle(
                                color: secondaryBlue, fontFamily: medium)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 76,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 80,
                            height: 76,
                            child: Column(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(c1)),
                                      color: Colors.teal.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Text('Gadgets')
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),

                //=================CATEGORY WIDGET END ========================

                const ProductScroller(),
                const SizedBox(
                  height: 30,
                ),
                OfferBanner(bannerColor: secondaryBlue),
                const SizedBox(
                  height: 30,
                ),
                ProductScroller(),
                const SizedBox(
                  height: 30,
                ),
                OfferBanner(bannerColor: secondaryYellow),
                const SizedBox(
                  height: 30,
                ),
                ProductScroller(),
                ProductScroller(),
              ],
            ),
          ),
        ));
  }
}

AppBar appBarHome({required String title, bool leadingIcon = true}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(icBell),
            const SizedBox(
              width: 10,
            ),
            Image.asset(icCart)
          ],
        ),
      )
    ],
    automaticallyImplyLeading: leadingIcon,
    foregroundColor: primaryColor,
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(style: const TextStyle(fontFamily: bold), title),
  );
}