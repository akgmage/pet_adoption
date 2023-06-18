import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class PetCard extends StatelessWidget {
  final String image;
  final String name;
  final int age;
  final int price;
  final String breed;

  PetCard(
      {required this.image,
      required this.name,
      required this.age,
      required this.breed,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.containerPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: Sizes.spreadRadius,
              blurRadius: Sizes.blurRadius,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Sizes.borderRadius)),
              child: Image.asset(
                image,
                height: Sizes.cardImageHeight,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Sizes.cardDetailPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.normalFontSize,
                    ),
                  ),
                  const SizedBox(height: Sizes.spacer / 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.cake,
                        color: Colors.grey,
                        size: Sizes.cakeIcon,
                      ),
                      const SizedBox(width: Sizes.spacer / 4),
                      Text(
                        '$age years old',
                        style: const TextStyle(
                          fontSize: Sizes.smallFontSize,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Breed: $breed / Rs $price',
                        style: const TextStyle(
                          fontSize: Sizes.smallFontSize,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
