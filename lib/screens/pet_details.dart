import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../widgets/button.dart';
import '../constants/sizes.dart';
import '../widgets/user_card.dart';

class PetDetailScreen extends StatelessWidget {
  final String image;
  final String name;
  final int age;
  final int price;
  final String breed;

  PetDetailScreen({
    required this.image,
    required this.name,
    required this.age,
    required this.price,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Sizes.photoViewHeight,
              width: double.infinity,
              alignment: Alignment.center,
              child: PhotoView(
                imageProvider: AssetImage(
                  image,
                ),
              ),
            ),
            const SizedBox(height: Sizes.spacer * 2),
            UserCard(
              name: name,
              age: age,
              breed: breed,
              price: price,
            ),
            const SizedBox(height: Sizes.spacer * 8),
            const AnimatedButton(),
            const SizedBox(height: Sizes.spacer)
            // Add your animated "Adopt Me" button here
            // You can use any animation library or Flutter's built-in animations
          ],
        ),
      ),
    );
  }
}
