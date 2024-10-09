import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;
import 'package:sanoko_shop2/var.dart';

import '../widget/expanded_constant_widget.dart';

//https://pub.dev/packages/widget_circular_animator-

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitelAndSearch(),
                DiscountBanner(),
                SizedBox(height: 15),
                CategoryList(),
                SizedBox(height: 6),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProductGrid(),
                  TaskBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskBar extends StatelessWidget {
  const TaskBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black.withOpacity(0.65),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Iconsax.home, color: Colors.white),
            Icon(Iconsax.heart, color: Colors.white),
            Icon(Iconsax.shop, color: Colors.white),
            Icon(Iconsax.user, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class TitelAndSearch extends StatelessWidget implements PreferredSizeWidget {
  const TitelAndSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingInHomeScreen, right: paddingInHomeScreen, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Find Your\nDream Furniture',
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: 45,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
                child: Icon(
              Iconsax.search_normal,
              color: Colors.black,
            )),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({Key? key}) : super(key: key);

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
              alignment: Alignment.bottomCenter,
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
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            'Until 24 Dec',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
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
  const CategoryList({Key? key}) : super(key: key);

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

  const CategoryChip({Key? key, required this.label, required this.isSelected})
      : super(key: key);

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
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        //horizontal: paddingInHomeScreen,
        vertical: 8,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 22),
            ProductCard(
              urlorpath: 'assets/images/products/offer.png',
              name: 'Product 1',
              price: '\$100',
            ),
            ProductCard(
              urlorpath: 'assets/images/products/4.png',
              name: 'Product 2',
              price: '\$250',
            ),
            ProductCard(
              urlorpath: 'assets/images/products/6.png',
              name: 'Product 3',
              price: '\$199',
            ),
            ProductCard(
              urlorpath: 'assets/images/products/3.png',
              name: 'Product 4',
              price: '\$589',
            ),
            SizedBox(width: 22),
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
    Key? key,
    required this.urlorpath,
    required this.name,
    required this.price,
  }) : super(key: key);

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
        height: 500,
        width: width / 1.8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ExpandedContentWidget(),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: isExpanded ? 80 : 0,
              child: GestureDetector(
                onPanUpdate: onPanUpdate,
                onTap: () {},
                child: ImageWithhart(widget: widget),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}

class ImageWithhart extends StatelessWidget {
  const ImageWithhart({
    super.key,
    required this.widget,
  });

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 2 - height / 10,
      width: width / 1.8,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xfff2eeeb),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: Color(0xffc87839),
              child: IconButton(
                icon: const Icon(Iconsax.heart, size: 20),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Center(
                    child: Image.asset(
                      widget.urlorpath,
                      //height: double.negativeInfinity,
                      height: height / 2 - height / 10 - 160,
                      width: width / 1.8 - 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              //const SizedBox(height: 12),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         widget.price,
              //         style: const TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.w900,
              //           color: Colors.black,
              //         ),
              //       ),
              //       const SizedBox(width: 20),
              //       Center(
              //         child: Container(
              //           padding: const EdgeInsets.symmetric(horizontal: 20),
              //           height: 40,
              //           //width: 40,
              //           decoration: BoxDecoration(
              //             color: Colors.teal,
              //             borderRadius: BorderRadius.circular(30),
              //           ),
              //           child: const Center(
              //             child: Text(
              //               'Add to Cart',
              //               style: TextStyle(color: Colors.white, fontSize: 15),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
