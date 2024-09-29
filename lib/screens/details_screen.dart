import 'dart:math';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

import 'package:sanoko_shop/var.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(
      {super.key,
      required this.urlorpath,
      required this.name,
      required this.price});

  final String urlorpath;
  final String name;
  final String price;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              productImage(context),
              const SizedBox(height: 20),
              titelandprice(),
              const SizedBox(height: 20),
              description(),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text('Color'),
                  SizedBox(width: 10),
                  TheColor(),
                  Spacer(),
                  TheQuinty(),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 10,
                      ),
                    ],
                    color: darkGreen,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Text description() {
    return Text(
      descriptions[Random().nextInt(descriptions.length)],
      style: const TextStyle(
        fontSize: 15,
        color: Colors.grey,
      ),
    );
  }

  Padding titelandprice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                names[Random().nextInt(names.length)],
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            '\$${widget.price}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget productImage(BuildContext context) {
    return Hero(
      tag: widget.urlorpath,
      child: Container(
        width: double.infinity,
        height: height / 1.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightOrange,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.6),
                    child: IconButton(
                      icon: const Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Icon(Icons.arrow_back_ios, size: 20)),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xffc87839),
                    child: IconButton(
                      icon: const Icon(Iconsax.heart, size: 20),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(
                    widget.urlorpath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TheQuinty extends StatefulWidget {
  const TheQuinty({super.key});

  @override
  State<TheQuinty> createState() => _TheQuintyState();
}

class _TheQuintyState extends State<TheQuinty> {
  int whatquinty = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (whatquinty > 1) {
                  whatquinty--;
                }
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(5),
            ),
            child: const Icon(Iconsax.minus, size: 20),
          ),
        ),
        const SizedBox(width: 10),
        Text(whatquinty.toString(),
            style: const TextStyle(
              fontSize: 18,
            )),
        const SizedBox(width: 10),
        SizedBox(
          height: 30,
          width: 30,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                whatquinty++;
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(5),
            ),
            child: const Icon(Iconsax.add, size: 20),
          ),
        ),
      ],
    );
  }
}

class TheColor extends StatefulWidget {
  const TheColor({super.key});

  @override
  State<TheColor> createState() => _TheColorState();
}

class _TheColorState extends State<TheColor> {
  int whatcolor = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        colorChose(Colors.grey, 0),
        colorChose(darkGreen, 1),
        colorChose(Colors.amber, 2),
      ],
    );
  }

  Widget colorChose(Color color, int index) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            whatcolor = index;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                // color: Colors.red,
                color: whatcolor == index
                    ? color.withOpacity(0.5)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
