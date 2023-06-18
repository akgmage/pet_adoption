import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final int age;
  final String breed;
  final int price;

  UserCard(
      {required this.name,
      required this.age,
      required this.breed,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set the width to take full width
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $name',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Age: $age',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Breed: $breed',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Price: Rs $price',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
