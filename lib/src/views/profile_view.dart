import 'package:experemental_app/src/views/settings_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatefulWidget {
  static const String id = "ProfileView";

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.menu),
              onSelected: (String route) {
                Navigator.of(context).pushNamed(route);
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text(
                          AppLocalizations.of(context)!.navigationSettings
                          ),
                      value: SettingsView.id,
                    ),
                  ]),
        ],
      ),
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
