import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:pa/models/per_card.dart';
import 'package:pa/screens/pet_details.dart';
import 'package:provider/provider.dart';

import '../data/pet_data.dart';
import '../models/theme_provider.dart';
import '../widgets/card.dart';
import '../widgets/pet_avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode myfocus = FocusNode();
  List<bool> selectedList = [true, false, false, false, false];
  String type = "cat";
  final List<Widget> avatars = [
    CircleAvatar(
      backgroundImage: AssetImage('assets/cat.jpg'),
      radius: 50,
    ),
    CircleAvatar(
      backgroundImage: AssetImage('assets/dog.jpg'),
      radius: 50,
    ),
    CircleAvatar(
      backgroundImage: AssetImage('assets/rabbit.jpg'),
      radius: 50,
    ),
    CircleAvatar(
      backgroundImage: AssetImage('assets/dog.jpg'),
      radius: 50,
    ),
    CircleAvatar(
      backgroundImage: AssetImage('assets/rabbit.jpg'),
      radius: 50,
    ),
  ];
  final controller = ScrollController();
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well

  // This list holds the data for the list view
  List<Pet> _foundPets = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundPets = petCards;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Pet> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = petCards;
    } else {
      results = petCards
          .where((pet) =>
              pet.name.toLowerCase().contains(enteredKeyword.toLowerCase()) &&
              pet.type == type)
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundPets = results;
    });
  }

  HawkFabMenuController hawkFabMenuController = HawkFabMenuController();
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          focusNode: myfocus,
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(
                Icons.search,
                size: 30,
              ),
              labelStyle: TextStyle(fontSize: 24)),
        ),
      ),
      body: HawkFabMenu(
          icon: AnimatedIcons.menu_arrow,
          fabColor: Color(0xff121212),
          iconColor: Colors.white,
          hawkFabMenuController: hawkFabMenuController,
          items: [
            HawkFabMenuItem(
                label: '',
                ontap: () {
                  themeChange.darkTheme = !themeChange.darkTheme;
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        themeChange.darkTheme
                            ? 'Switched to darkmode'
                            : 'switched to light mode',
                      ),
                    ),
                  );
                },
                icon: themeChange.darkTheme
                    ? Icon(
                        Icons.sunny,
                        color: Colors.orange,
                      )
                    : Icon(Icons.mode_night),
                color: themeChange.darkTheme ? Colors.white : Color(0xff7cb9df),
                labelColor: Colors.blue,
                labelBackgroundColor: Colors.transparent),
            HawkFabMenuItem(
              label: '',
              ontap: () {
                //TODO: show adopted pets
              },
              icon: const Icon(Icons.history),
              color: themeChange.darkTheme ? Colors.white : Color(0xff7cb9df),
              labelColor: Colors.white,
              labelBackgroundColor: Colors.transparent,
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: avatars.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            myfocus.unfocus();
                            selectedList = List.generate(
                                avatars.length, (i) => i == index);
                            print(index);
                            if (index == 0) {
                              type = "cat";
                            } else if (index == 1) {
                              type = "dog";
                            } else {
                              type = "rabbit";
                            }
                          });
                        },
                        child: PetAvatar(
                          backgroundColor: selectedList[index]
                              ? const Color(0xff7cb9df)
                              : Colors.transparent,
                          avatars: avatars,
                          backgroundImage:
                              (avatars[index] as CircleAvatar).backgroundImage,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _foundPets.isNotEmpty
                      ? ListView.builder(
                          itemCount: _foundPets.length,
                          itemBuilder: (context, index) {
                            return _foundPets[index].type == type
                                ? Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        myfocus.unfocus();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PetDetailScreen(
                                              pet: _foundPets[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: PetCard(
                                        pet: _foundPets[index],
                                      ),
                                    ),
                                  )
                                : const SizedBox();
                          },
                        )
                      : const Text(
                          'No results found',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                ),
              ],
            ),
          )),
    );
  }
}
