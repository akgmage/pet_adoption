import 'package:flutter/material.dart';
import 'package:pa/constants/sizes.dart';
import 'package:pa/models/per_card.dart';
import 'package:pa/screens/home_screen.dart';
import 'package:pa/widgets/button.dart';
import 'package:pa/widgets/pet_info_card.dart';
import 'package:photo_view/photo_view.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;
  PetDetailScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    List<bool> seleectedList = [];
    if (pet.type == "cat") {
      seleectedList = [true, false, false, false];
    } else if (pet.type == "dog") {
      seleectedList = [false, true, false, false];
    } else if (pet.type == "rabbit") {
      seleectedList = [false, false, true, false];
    } else if (pet.type == "bird") {
      seleectedList = [false, false, false, true];
    }
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      type: pet.type,
                      selectedList: seleectedList,
                    )));
        return true;
      },
      child: Scaffold(
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
              const SizedBox(height: Sizes.spacer),
              AnimatedButton(
                pet: pet,
              ),

              const SizedBox(height: Sizes.spacer)
              // Add your animated "Adopt Me" button here
              // You can use any animation library or Flutter's built-in animations
            ],
          ),
        ),
      ),
    );
  }
}
