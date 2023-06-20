import 'package:flutter/material.dart';
import 'package:pa/constants/sizes.dart';

class PetAvatar extends StatelessWidget {
  const PetAvatar({
    Key? key,
    required this.avatars,
    required this.backgroundColor,
    required this.backgroundImage,
  }) : super(key: key);

  final List<Widget> avatars;
  final Color backgroundColor;
  final ImageProvider? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.spacer / 2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: Sizes.circleAvatarRadius,
            backgroundColor: backgroundColor,
          ),
          CircleAvatar(
            radius: Sizes.circleAvatarRadius - 5,
            backgroundImage: backgroundImage,
          ),
        ],
      ),
    );
  }
}
