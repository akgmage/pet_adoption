import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import '../models/per_card.dart';

class PetInfoCard extends StatelessWidget {
  final Pet pet;

  PetInfoCard({required this.pet});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Set the width to take full width
      child: Card(
        elevation: Sizes.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.spacer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${pet.name}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Age: ${pet.age}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Breed: ${pet.breed}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Price: Rs ${pet.price}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
