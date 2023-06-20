import 'package:flutter/material.dart';
import 'package:pa/constants/sizes.dart';

class Filter extends StatefulWidget {
  final int? itemCount;
  final void Function()? onTap;
  final Color? backgroundColor;
  final ImageProvider? backgroundImage;
  const Filter(
      {Key? key,
      this.itemCount,
      this.onTap,
      this.backgroundColor,
      this.backgroundImage})
      : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.topFilterHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.spacer / 2),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: Sizes.circleAvatarRadius,
                    backgroundColor: widget.backgroundColor,
                  ),
                  CircleAvatar(
                    radius: Sizes.circleAvatarRadius - 5,
                    backgroundImage: widget.backgroundImage,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
