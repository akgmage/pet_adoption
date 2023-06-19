import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:pa/models/per_card.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

import '../constants/sizes.dart';
import '../models/theme_provider.dart';
import '../shared/shared_pref.dart';

class AnimatedButton extends StatefulWidget {
  final Pet pet;
  const AnimatedButton({Key? key, required this.pet}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  AdoptedPetsPreference pref = AdoptedPetsPreference();
  List list = [];
  bool found = false;
  @override
  initState() {
    AdoptedPetsPreference pref = AdoptedPetsPreference();
    // at the beginning, all users are shown
    pref.getAdoptedList().then((value) {
      setState(() {
        list = value;
        found = list.contains(widget.pet.id.toString());
        print(found);
      });
    });
    print(list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return !found
        ? SliderButton(
            buttonColor:
                themeChange.darkTheme ? Color(0xff181818) : Color(0xfff8bf96),
            backgroundColor:
                themeChange.darkTheme ? Color(0xFF404040) : Color(0xff7cb9df),
            action: () async {
              setState(() {
                _displaySuccessMotionToast(widget.pet);
                print(widget.pet.id);
                pref.setAdoptedID(widget.pet.id);
              });
            },
            label: const Text(
              "Swipe to Adopt",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.mediumFontSize),
            ),
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          )
        : const Padding(
            padding: EdgeInsets.all(Sizes.spacer * 2),
            child: Text(
              'Sorry this pet is already adopted',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          );
  }

  void _displaySuccessMotionToast(Pet pet) {
    MotionToast toast = MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(
        'Congratulations! you adopted ${pet.name}',
        style: const TextStyle(fontSize: Sizes.smallFontSize - 2),
      ),
      layoutOrientation: ToastOrientation.rtl,
      animationType: AnimationType.fromRight,
      dismissable: true,
    );
    toast.show(context);
    Future.delayed(const Duration(seconds: 5)).then((value) {
      toast.dismiss();
    });
  }
}
