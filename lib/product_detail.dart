// ignore_for_file: must_be_immutable

import 'package:e_commerce_demo/components/bottom_navigation.dart';
import 'package:e_commerce_demo/label.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle, {super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color? selectedColor;
  List<Color> colors = [
    const Color(0XFF52514F),
    const Color(0XFF0001FC),
    const Color(0XFF6F7972),
    const Color(0XFFF5D8C0),
  ];

  List<int> capacities = [64, 128, 256];
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
                //header
                children: [
                  header(widget.productTitle, context),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label('New'),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: Image.asset('assets/png/smartphoneBig.png')),
                        const SizedBox(height: 25),
                        const Text('Colors',
                            style: TextStyle(color: Color(0xff0a1034), fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: colors
                              .map((Color color) => buildColor(
                                  color: color,
                                  isSelected: selectedColor == color,
                                  onTap: () {
                                    setState(() {
                                      selectedColor = color;
                                    });
                                  }))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text('Capacity',
                            style: TextStyle(color: Color(0xff0a1034), fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildCapacity(64),
                            const SizedBox(width: 15),
                            buildCapacity(128),
                            const SizedBox(width: 15),
                            buildCapacity(256),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar('search'),
            Padding(
              padding: const EdgeInsets.only(top: 625, left: 60, right: 60),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(color: Colors.blue[900], borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Add to cart',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 240, 240)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildColor({required Color color, required bool isSelected, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: const Color.fromARGB(15, 99, 26, 103), width: isSelected ? 3 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

Widget buildCapacity(int capacity) {
  return Column(
    children: [
      Text('$capacity GB', style: const TextStyle(color: Color(0xff0a1034), fontSize: 18, fontWeight: FontWeight.w400)),
    ],
  );
}
