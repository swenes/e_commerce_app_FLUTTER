import 'dart:ui';

import 'package:e_commerce_demo/categorie_current_page.dart';
import 'package:e_commerce_demo/components/header.dart';
import 'package:flutter/material.dart';

import 'components/bottom_navigation.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key? key}) : super(key: key);
  final List<String> categories = [
    "All",
    "Computers",
    "Accessories",
    "Smartphones",
    "Smartobjects",
    "Speakers",
    "Mouse",
    "Keyboard",
    "Car Mechanic",
    "Rent",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //header
                  header('Categories', context),
                  //kategoriler
                  Expanded(
                      child:
                          ListView(children: categories.map((String title) => buildCategorie(title, context)).toList()))
                ],
              ),
            ),

            //bottom navigationb bar
            bottomNavigationBar('search')
          ],
        ),
      ),
    );
  }
}

Widget buildCategorie(String title, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CategorieCurrent(title);
          },
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 4, offset: const Offset(0, 4))]),
      child: Text(
        title,
        style: const TextStyle(color: Color(0xff0a1034), fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
