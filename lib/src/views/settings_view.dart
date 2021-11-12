import 'package:experemental_app/src/settings/settings_controller.dart';
import 'package:experemental_app/src/theme/theme_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatefulWidget {
  SettingsView({Key? key}) : super(key: key);

  static const String id = "SettingsView";

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  // late SettingsController _settingsController;

  late int? _dropdownValue;

  @override
  void initState() {
    // Todo: sharedpreferences
    _dropdownValue = themeManager.currentThemeIndex;

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      //
      body: Center(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Theme app", style: TextStyle(fontSize: 16)),
                DropdownButton(
                  underline: DropdownButtonHideUnderline(child: Container()),
                  hint: Text("Set theme"),
                  value: _dropdownValue,
                  items: [
                    for (int index = 0;
                        index < themeManager.themes.length;
                        index++)
                      DropdownMenuItem(
                        child: Text(themeManager.themes[index]),
                        value: index,
                      )
                  ],
                  onChanged: (int? newValue) {
                    setState(() {
                      _dropdownValue = newValue;
                      settingsController.changeTheme(newValue);
                    });
                  },
                ),
              ],
            ),
          ),

        ],
      )),
    );
  }
}
