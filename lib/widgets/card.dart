import 'package:flutter/material.dart';
import 'package:pa/constants/sizes.dart';
import 'package:pa/models/per_card.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final bool adopted;

  PetCard({required this.pet, required this.adopted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.containerPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(Sizes.borderRadius)),
                child: ColorFiltered(
                  colorFilter: adopted
                      ? ColorFilter.mode(
                          Colors.grey,
                          BlendMode.saturation,
                        )
                      : ColorFilter.mode(
                          Colors.transparent,
                          BlendMode.multiply,
                        ),
                  child: Image.asset(
                    pet.imageAsset,
                    height: Sizes.cardImageHeight,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Sizes.cardDetailPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name,
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
                          '${pet.age} years old',
                          style: const TextStyle(
                            fontSize: Sizes.smallFontSize,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Breed: ${pet.breed} / Rs ${pet.price}',
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
      ),
    );
  }
}
