import 'package:e_commerce_demo/components/bottom_navigation.dart';
import 'package:e_commerce_demo/product_detail.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class CategorieCurrent extends StatelessWidget {
  String categoryTitle;
  CategorieCurrent(this.categoryTitle);

  List<Map> products = [
    {"isim": "Surface Laptop 3", "fotograf": "assets/png/laptop.png", "fiyat": "999"},
    {"isim": "iPhone 11 Pro", "fotograf": "assets/png/laptop.png", "fiyat": "999"},
    {"isim": "Mackbook Pro", "fotograf": "assets/png/laptop.png", "fiyat": "999"},
    {"isim": "Bicycle", "fotograf": "assets/png/laptop.png", "fiyat": "999"},
    {"isim": "Surface Laptop 7", "fotograf": "assets/png/laptop.png", "fiyat": "999"},
    {"isim": "Surface Laptop 8", "fotograf": "assets/png/laptop.png", "fiyat": "999"},
    {"isim": "Surface Laptop 9", "fotograf": "assets/png/laptop.png", "fiyat": "999"},
    {"isim": "Surface Laptop 10", "fotograf": "assets/png/laptop.png", "fiyat": "999"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //header
                children: [
                  header(categoryTitle, context),
                  const SizedBox(height: 15),

                  // içerikler

                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: products.map((Map product) {
                        return buildContent(product["isim"], product["fotograf"], product["fiyat"], context);
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar('search')
          ],
        ),
      ),
    );
  }
}

Widget buildContent(String title, String path, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ProductDetailPage(title);
          },
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 16),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Image.asset(path),
          const SizedBox(height: 18),
          Column(
            children: [
              Text(title, style: const TextStyle(color: Color(0xff0a1034), fontSize: 16, fontWeight: FontWeight.w500)),
              Text('USD $price',
                  style: const TextStyle(color: Color(0xff0001fc), fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    ),
  );
}
