import 'package:experemental_app/src/theme/theme_manager.dart';
import 'package:experemental_app/src/views/home_view.dart';
import 'package:experemental_app/src/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  static const String id = "MainView";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // late AppBottomNavigationBar _appBottomNavigationBar;
  late List<Widget> _views;
// Text(AppLocalizations.of(context)!.navigationProfile)
  late int _selectedIndex;

  

  @override
  void initState() {


    _selectedIndex = 0;

    _views = [
      HomeView(),
      ProfileView(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _appBottomNavigationBar = AppBottomNavigationBar(context: context, selectedIndex: _selectedIndex);

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      body: _views[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.navigationHome,
            selectedIcon: Icon(Icons.home_outlined),
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.navigationProfile,
            selectedIcon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
