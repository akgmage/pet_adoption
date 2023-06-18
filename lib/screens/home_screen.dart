import 'package:flutter/material.dart';
import 'package:pa/models/per_card.dart';
import 'package:pa/screens/pet_details.dart';

import '../data/pet_data.dart';
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
  List<Pet> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = petCards;
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
          .where((user) =>
              user.name.toLowerCase().contains(enteredKeyword.toLowerCase()) &&
              user.type == type)
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: TextField(
          focusNode: myfocus,
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              labelStyle: TextStyle(color: Colors.white, fontSize: 24)),
        ),
      ),
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
                        selectedList =
                            List.generate(avatars.length, (i) => i == index);
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
                          ? Colors.purple.shade300
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
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) {
                        return _foundUsers[index].type == type
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    myfocus.unfocus();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PetDetailScreen(
                                          pet: _foundUsers[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: PetCard(
                                    pet: _foundUsers[index],
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
