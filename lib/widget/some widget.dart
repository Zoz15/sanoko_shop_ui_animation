import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;
import 'package:sanoko_shop/screens/home_screen.dart';
import 'package:sanoko_shop/var.dart';

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
        child: const Row(
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

class TitelAndSearch extends StatelessWidget {
  const TitelAndSearch({super.key});

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
              fontSize: 30,
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
}

class ImageWithhart extends StatelessWidget {
  const ImageWithhart({
    super.key,
    required this.widget,
  });

  final ProductCard widget;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.urlorpath,
      child: Container(
        height: height / 2 - height / 10,
        width: width / 1.8,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xfff2eeeb),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: const Color(0xffc87839),
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
                Text(
                  '  \$ ${widget.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
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
      ),
    );
  }
}
