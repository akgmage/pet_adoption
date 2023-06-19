import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

class AdoptedPetsPreference {
  static const id = "petID";
  static const idl = "petIDList";

  setAdoptedID(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mList = (prefs.getStringList(idl) ?? []);
    if (!mList.contains(value.toString())) {
      mList.add(value.toString());
      prefs.setStringList(idl, mList);
    }
  }

  Future<List<String>> getAdoptedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // fetch your string list
    List<String> mList = (prefs.getStringList(idl) ?? []);
    print(mList);
    return mList;
  }
}
