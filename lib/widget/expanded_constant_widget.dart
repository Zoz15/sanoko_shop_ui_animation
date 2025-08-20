import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sanoko/var.dart';

class ExpandedContentWidget extends StatelessWidget {
  const ExpandedContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const StarsWidget(),
              const SizedBox(width: 10),
              Text(
                '\$${prices[Random().nextInt(prices.length)]}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          buildReview(),
        ],
      ),
    );
  }

  Widget buildReview() => Row(
        children: List.generate(
            4,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(
                        'assets/images/users/user${Random().nextInt(3) + 1}.png'),
                  ),
                )).toList(),
      );
}

class StarsWidget extends StatelessWidget {
  const StarsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stars = (Random().nextDouble() * 4.9 + 0.1).toStringAsFixed(1);
    final allStars =
        List.generate(5, (index) => index < double.parse(stars).floor());

    return Row(
      children: allStars
          .map((star) => Container(
                margin: EdgeInsets.only(right: 4),
                child: Icon(Icons.star_rate, size: 18, color: Colors.blueGrey),
              ))
          .toList(),
    );
  }
}
