import 'package:flutter/material.dart';

import 'categories_page.dart';
import 'components/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: ListView(
                  children: [
                    //başlık
                    buildBaslik(title: 'Home'),
                    //banner
                    buildBanner(),
                    //butonlar
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildNavigation(
                              categoryName: "Categories",
                              icon: Icons.category_outlined,
                              widget: CategoriesPage(),
                              context: context),
                          buildNavigation(
                              categoryName: "Favorites",
                              icon: Icons.star_outline_sharp,
                              widget: const HomeScreen(),
                              context: context),
                          buildNavigation(
                              categoryName: "Gifts",
                              icon: Icons.card_giftcard_rounded,
                              widget: const HomeScreen(),
                              context: context),
                          buildNavigation(
                              categoryName: "Best selling",
                              icon: Icons.bar_chart_outlined,
                              widget: const HomeScreen(),
                              context: context)
                        ],
                      ),
                    ),

                    //sales title
                    Center(child: buildBaslik(title: "Sales")),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildSalesItem(
                            name: 'Smartphones',
                            path: 'assets/png/smartphone.png',
                            discount: 50,
                            screenWidth: screenwidth),
                        buildSalesItem(
                            name: 'Smartphones',
                            path: 'assets/png/smartphone.png',
                            discount: 25,
                            screenWidth: screenwidth),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildSalesItem(
                            name: 'Earphones', path: 'assets/png/earphone.png', discount: 75, screenWidth: screenwidth),
                        buildSalesItem(
                            name: 'Earphones ',
                            path: 'assets/png/earphone.png',
                            discount: 25,
                            screenWidth: screenwidth),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildSalesItem(
                            name: 'Laptops', path: 'assets/png/laptop.png', discount: 75, screenWidth: screenwidth),
                        buildSalesItem(
                            name: 'Laptops', path: 'assets/png/laptop.png', discount: 25, screenWidth: screenwidth),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //BOTTOM NAVIGATION BAR
            bottomNavigationBar('home')
          ],
        ),
      ),
    );
  }

  Widget buildNavigation(
      {required String categoryName, required IconData icon, required Widget widget, required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return widget;
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffe0ecf8),
            ),
            child: Icon(icon),
          ),
          const SizedBox(height: 8),
          Text(
            categoryName,
            style: const TextStyle(color: Color(0xff1f53e4), fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

Widget buildBaslik({required String title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0),
    child: Text(
      title,
      style: const TextStyle(fontSize: 32, color: Color(0xff0a1034), fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildBanner() {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 24, right: 15, top: 0, bottom: 0),
      decoration: BoxDecoration(color: const Color(0xff0001fc), borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Bose Home Speaker',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                'USD 279',
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Image.asset(
            "assets/png/speaker.png",
            fit: BoxFit.cover,
          )
        ],
      ),
    ),
  );
}

Widget buildSalesItem(
    {required String name, required String path, required int discount, required double screenWidth}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 21),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xffe0ecf8),
          ),
          child: Text(
            textAlign: TextAlign.center,
            '-$discount%',
            style: const TextStyle(color: Color(0xff1f53e4), fontSize: 15, backgroundColor: Color(0xffe0ecf8)),
          ),
        ),
        const SizedBox(height: 10),
        Image.asset(path),
        const SizedBox(height: 10),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            name,
            style: const TextStyle(fontSize: 18, color: Color(0xff0a1034)),
          ),
        ),
      ],
    ),
  );
}
