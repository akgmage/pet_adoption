import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../models/per_card.dart';
import '../widgets/button.dart';
import '../constants/sizes.dart';
import '../widgets/pet_info_card.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;

  PetDetailScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
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
                  pet.imageAsset,
                ),
              ),
            ),
            const SizedBox(height: Sizes.spacer * 2),
            PetInfoCard(
              pet: pet,
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
