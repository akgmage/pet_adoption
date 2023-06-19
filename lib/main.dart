// main.dart
import 'package:flutter/material.dart';
import 'package:pa/screens/home_screen.dart';
import 'package:pa/theme/styles.dart';
import 'package:pa/widgets/pet_avatar.dart';
import 'package:pa/screens/pet_details.dart';
import 'package:provider/provider.dart';

import 'models/theme_provider.dart';
import 'widgets/card.dart';
import 'data/pet_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: HomePage(),
          );
        },
      ),
    );
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Pet Adoption',
      home: HomePage(),
    );
  }
}
