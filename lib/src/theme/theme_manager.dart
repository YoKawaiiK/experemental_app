import "package:flutter/material.dart";

class ThemeManager {
  // constants
  static final Color _lightPrimaryColor = Colors.red[100]!;
  static final Color _lightPrimaryVariantColor = Colors.red.shade100;
  static final Color _lightSecondaryColor = Colors.purple[100]!;
  static final Color _lightAccentColor = Colors.green[100]!;
  static final Color _lightOnPrimaryColor = Colors.black;

  static final Color _lightBackgroundColor = Colors.white;

  static final Color _darkPrimaryColor = Colors.teal[500]!;
  static final Color _darkPrimaryVariantColor = Colors.teal.shade500;
  static final Color _darkSecondaryColor = Colors.purple[500]!;
  static final Color _darkAccentColor = Colors.amber[500]!;
  static final Color _darkOnPrimaryColor = Colors.white;

  static final Color _darkOnAccentColor = Colors.black;

  static final Color _darkBackgroundColor = Colors.black;

  ThemeMode _themeMode = ThemeMode.light;
  late int _currentThemeIndex;

  late List<String> _themes;

  ThemeManager() {
    _initState();
  }

  void _initState() {
    _themeMode = ThemeMode.light;
    _themes = [
      "System",
      "Light",
      "Dark",
    ];
    _currentThemeIndex = 0;
  }

  // private data

  void changeTheme(int? index) {
    print("changeTheme : $index");
    _currentThemeIndex = index!;

    switch (_currentThemeIndex) {
      case 0:
        _themeMode = ThemeMode.system;
        break;
      case 1:
        _themeMode = ThemeMode.light;
        break;
      case 2:
        _themeMode = ThemeMode.dark;
        break;
    }
  }

  // getter
  ThemeMode get themeMode => _themeMode;
  List<String> get themes => _themes;
  int get currentThemeIndex => _currentThemeIndex;

  // Theme
  ThemeData ligth() => ThemeData(
        primaryColor: _lightPrimaryColor,
        colorScheme: ColorScheme.light(
          secondary: _lightSecondaryColor,
        ),
        scaffoldBackgroundColor: _lightBackgroundColor,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: _lightPrimaryColor,
          indicatorColor: _lightAccentColor,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
                fontSize: 14,
                color: _lightOnPrimaryColor,
                fontWeight: FontWeight.w700),
          ),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 14, color: _lightOnPrimaryColor,)
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: _lightPrimaryColor,
          iconTheme: IconThemeData(
            color: _lightOnPrimaryColor,
          ),
        ),
      );

  ThemeData dark() => ThemeData(
        primaryColor: _darkPrimaryColor,
        colorScheme: ColorScheme.dark(
          secondary: _darkSecondaryColor,
        ),
        scaffoldBackgroundColor: _darkBackgroundColor,
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: _darkAccentColor,
          backgroundColor: _darkPrimaryColor,
          iconTheme: MaterialStateProperty.all(
            IconThemeData(
              color: _darkOnAccentColor,
            ),
          ),
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
                fontSize: 14,
                color: _darkOnAccentColor,
                fontWeight: FontWeight.w700),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: _darkPrimaryColor,
          iconTheme: IconThemeData(
            color: _darkOnPrimaryColor,
          ),
        ),
      );
}

ThemeManager themeManager = ThemeManager();
