import 'package:flutter/material.dart';
import 'package:pa/data/pet_data.dart';

import '../constants/sizes.dart';
import '../models/per_card.dart';
import '../shared/shared_pref.dart';

class AdoptedPets extends StatefulWidget {
  const AdoptedPets({Key? key}) : super(key: key);

  @override
  State<AdoptedPets> createState() => _AdoptedPetsState();
}

class _AdoptedPetsState extends State<AdoptedPets> {
  List list = [];
  @override
  initState() {
    AdoptedPetsPreference pref = AdoptedPetsPreference();
    // at the beginning, all users are shown
    pref.getAdoptedList().then((value) {
      setState(() {
        print(list);
        list = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopted Pets'),
      ),
      body: list.isNotEmpty
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        petCards[int.parse(list[index]) - 1].imageAsset),
                  ),
                  title:
                      Text(petCards[int.parse(list[index]) - 1].id.toString()),
                  subtitle: Text(petCards[int.parse(list[index]) - 1].name),
                  trailing: Text(
                      'Breed: ${petCards[int.parse(list[index]) - 1].breed}'),
                );
              },
            )
          : Center(
              child: const Text(
                "Nothing here!",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Sizes.mediumFontSize),
              ),
            ),
    );
  }
}
