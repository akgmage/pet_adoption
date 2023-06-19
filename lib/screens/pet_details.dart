import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../models/per_card.dart';
import '../models/theme_provider.dart';
import '../shared/shared_pref.dart';
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
            const SizedBox(height: Sizes.spacer * 8),
            PetInfoCard(
              pet: pet,
            ),
            AnimatedButton(
              pet: pet,
            ),
            const SizedBox(height: Sizes.spacer)
            // Add your animated "Adopt Me" button here
            // You can use any animation library or Flutter's built-in animations
          ],
        ),
      ),
    );
  }
}
