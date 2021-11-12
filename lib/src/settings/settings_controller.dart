import 'package:experemental_app/src/theme/theme_manager.dart';
import 'package:flutter/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:experemental_app/src/constants/constants.dart' as constants;

class SettingsController extends ChangeNotifier {
  SettingsController() {
    _initState();
  }

  void _initState() {
    _setThemeFromData();
  }

  void changeTheme(int? index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt(constants.settingTheme, index ?? 0);

    themeManager.changeTheme(index);

    notifyListeners();
  }

  void _setThemeFromData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int theme = prefs.getInt(constants.settingTheme) ?? 0;
    themeManager.changeTheme(theme);
    notifyListeners();
  }
  

  // void getAllData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   for (var setting in prefs.getKeys()) {
  //     print("${setting}: ${prefs.get(setting)}");
  //   }
  // }

}

// singleton
SettingsController settingsController = SettingsController();
