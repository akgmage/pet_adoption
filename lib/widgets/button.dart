import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

import '../models/theme_provider.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SliderButton(
      buttonColor:
          themeChange.darkTheme ? Color(0xff181818) : Color(0xfff8bf96),
      backgroundColor:
          themeChange.darkTheme ? Color(0xFF404040) : Color(0xff7cb9df),
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
