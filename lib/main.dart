// main.dart
import 'package:flutter/material.dart';
import 'package:pa/screens/home_screen.dart';
import 'package:pa/widgets/pet_avatar.dart';
import 'package:pa/screens/pet_details.dart';

import 'widgets/card.dart';
import 'data/pet_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Pet Adoption',
      home: HomePage(),
    );
  }
}
