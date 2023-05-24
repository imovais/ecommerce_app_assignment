import 'package:ecommerce_app_assignment/utlls_app/consts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarHome(title: appname),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 315,
                  height: 150,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey.shade200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey.shade300,
                          child: const Text('hello'),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
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
