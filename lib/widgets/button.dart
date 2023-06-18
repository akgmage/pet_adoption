import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return SliderButton(
      buttonColor: Colors.purple.shade300,
      backgroundColor: Colors.deepPurple.shade500,
      action: () {
        ///Do something here
        Navigator.of(context).pop();
      },
      label: const Text(
        "Swipe to Adopt",
        style: TextStyle(
            color: Color(0xff4a4a4a),
            fontWeight: FontWeight.w500,
            fontSize: 17),
      ),
      icon: const Icon(
        Icons.send,
        color: Colors.white,
      ),
    );
  }
}
