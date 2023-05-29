// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app_assignment/screens_app/home_screen/add_product_form.dart';
import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:ecommerce_app_assignment/widgets_app/product_horizontal_list_new.dart';
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
      appBar: appBarHome(title: appname, leadingIcon: true, context),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: const TextField(
                  decoration: InputDecoration(
                      suffixIconColor: primaryColor,
                      hintText: 'Search Product Name',
                      fillColor: widgetBG,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: widgetBG),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: ImageIcon(AssetImage(icSearch))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              OfferBanner(bannerColor: Colors.green, imagebanner: banner1),
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
                                    image:
                                        DecorationImage(image: AssetImage(c1)),
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

              ProductScrollerNew(
                cat: 'Category.Feature',
                topTitle: 'Feature Products',
                // listcat: 'feature'
              ),
              const SizedBox(
                height: 30,
              ),
              OfferBanner(bannerColor: secondaryBlue),
              const SizedBox(
                height: 30,
              ),
              ProductScrollerNew(
                cat: 'Category.Best Seller',
                topTitle: 'Best Sellers',
                // listcat: 'bestseller',
              ),
              const SizedBox(
                height: 30,
              ),
              OfferBanner(bannerColor: secondaryYellow),
              const SizedBox(
                height: 30,
              ),
              ProductScroller(
                topTitle: 'New Arrivals',
              ),
              ProductScroller(
                topTitle: 'Top Rated Products',
              ),
              ProductScroller(
                topTitle: 'Special Offers',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: secondaryBlue),
        unselectedIconTheme: IconThemeData(color: primaryColor),
        backgroundColor: primaryBG,
        showUnselectedLabels: true,
        currentIndex: 0,
        //fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(wishlist),
            label: 'WISHLIST',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(bag),
            label: 'BAG',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(profile),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}

AppBar appBarHome(context, {required String title, bool leadingIcon = true}) {
  return AppBar(
    leading: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductForm(),
              ));
        },
        child: Icon(Icons.add)),
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
    automaticallyImplyLeading: leadingIcon,
    foregroundColor: primaryColor,
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(style: const TextStyle(fontFamily: bold), title),
  );
}
