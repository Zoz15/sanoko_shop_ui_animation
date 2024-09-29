import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sanoko_shop/screens/details_screen.dart';
import 'package:sanoko_shop/var.dart';
import 'package:sanoko_shop/widget/some%20widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitelAndSearch().animate().scaleY(begin: 0, end: 1),
                  DiscountBanner().animate().scaleY(
                      begin: 0,
                      end: 1,
                      delay: const Duration(milliseconds: 100)),
                  SizedBox(height: 15),
                  CategoryList().animate().scaleY(
                      begin: 0,
                      end: 1,
                      delay: const Duration(milliseconds: 200)),
                  SizedBox(height: 6),
                  ProductGrid().animate().scaleY(
                      begin: 0,
                      end: 1,
                      delay: const Duration(milliseconds: 300)),
                  SizedBox(
                    height: 90,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: const TaskBar()
                  .animate()
                  .show(delay: const Duration(milliseconds: 400)),
            )
          ],
        ),
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingInHomeScreen,
          right: paddingInHomeScreen,
          //top: 15,
          bottom: 20),
      child: SizedBox(
        height: 170,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter, // Updated alignment
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/backgroundOfOfer.png'),
                      fit: BoxFit.cover),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20% OFF',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Until 24 Dec',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/products/8.png',
                height: 160,
                //width: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: paddingInHomeScreen - 5),
          const CategoryChip(label: 'All', isSelected: false),
          const CategoryChip(label: 'Chairs', isSelected: true),
          const CategoryChip(label: 'Tables', isSelected: false),
          const CategoryChip(label: 'Sofas', isSelected: false),
          const CategoryChip(label: 'Wardrobes', isSelected: false),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip(
      {super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black54 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        //horizontal: paddingInHomeScreen,
        vertical: 8,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 22),
            ProductCard(
              urlorpath: 'assets/images/products/offer.png',
              name: titel[Random().nextInt(titel.length)],
              price: prices[Random().nextInt(prices.length)],
            ),
            ProductCard(
              urlorpath: 'assets/images/products/4.png',
              name: titel[Random().nextInt(titel.length)],
              price: prices[Random().nextInt(prices.length)],
            ),
            ProductCard(
              urlorpath: 'assets/images/products/6.png',
              name: titel[Random().nextInt(titel.length)],
              price: prices[Random().nextInt(prices.length)],
            ),
            ProductCard(
              urlorpath: 'assets/images/products/3.png',
              name: titel[Random().nextInt(titel.length)],
              price: prices[Random().nextInt(prices.length)],
            ),
            const SizedBox(width: 22),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String urlorpath;
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.urlorpath,
    required this.name,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: height / 2 - height / 10,
        width: width / 1.8,
        child: GestureDetector(
          //onPanUpdate: onPanUpdate,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                        urlorpath: widget.urlorpath,
                        name: widget.name,
                        price: widget.price)));
            // todo: go to product details screen
          },
          child: ImageWithhart(widget: widget),
        ),
      ),
    );
  }
}
