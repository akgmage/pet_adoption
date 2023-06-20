import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:pa/constants/color.dart';
import 'package:pa/data/pet_data.dart';
import 'package:pa/models/per_card.dart';
import 'package:pa/models/theme_provider.dart';
import 'package:pa/screens/adopted_pets.dart';
import 'package:pa/screens/pet_details.dart';
import 'package:pa/shared/shared_pref.dart';
import 'package:pa/widgets/card.dart';
import 'package:pa/widgets/pet_avatar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  List<bool> selectedList;
  String type;
  HomePage({Key? key, required this.selectedList, required this.type})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode myfocus = FocusNode();
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
      backgroundImage: AssetImage('assets/bird1.jpg'),
      radius: 50,
    ),
  ];
  final controller = ScrollController();
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well

  // This list holds the data for the list view
  List<Pet> _foundPets = [];
  List<String> list = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundPets = petCards;
    AdoptedPetsPreference pref = AdoptedPetsPreference();
    // at the beginning, all users are shown
    pref.getAdoptedList().then((value) {
      setState(() {
        list = value;
      });
    });
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
              pet.type == widget.type)
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
    AdoptedPetsPreference pref = AdoptedPetsPreference();
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
          fabColor:
              themeChange.darkTheme ? AppColors.darkBlack : AppColors.lightBlue,
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
                            ? 'Switched to dark mode'
                            : 'Switched to light mode',
                      ),
                    ),
                  );
                },
                icon: themeChange.darkTheme
                    ? const Icon(
                        Icons.sunny,
                        color: Colors.orange,
                      )
                    : const Icon(Icons.mode_night),
                color:
                    themeChange.darkTheme ? Colors.white : AppColors.lightBlue,
                labelColor: Colors.blue,
                labelBackgroundColor: Colors.transparent),
            HawkFabMenuItem(
              label: '',
              ontap: () {
                pref.getAdoptedList();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdoptedPets()));
              },
              icon: const Icon(Icons.history),
              color: themeChange.darkTheme ? Colors.white : AppColors.lightBlue,
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
                            widget.selectedList = List.generate(
                                avatars.length, (i) => i == index);
                            print(index);
                            if (index == 0) {
                              widget.type = "cat";
                            } else if (index == 1) {
                              widget.type = "dog";
                            } else if (index == 2) {
                              widget.type = "rabbit";
                            } else if (index == 3) {
                              widget.type = "bird";
                            }
                          });
                        },
                        child: PetAvatar(
                          backgroundColor: widget.selectedList[index]
                              ? AppColors.lightBlue
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
                            return _foundPets[index].type == widget.type
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
                                        adopted: list.contains(
                                            _foundPets[index].id.toString()),
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
