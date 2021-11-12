import 'package:experemental_app/src/settings/settings_controller.dart';
import 'package:experemental_app/src/theme/theme_manager.dart';
import 'package:experemental_app/src/views/home_view.dart';
import 'package:experemental_app/src/views/main_view.dart';
import 'package:experemental_app/src/views/profile_view.dart';
import 'package:experemental_app/src/views/settings_view.dart';
import 'package:experemental_app/src/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    // required this.settingsController,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ThemeManager _themeManager = ThemeManager();
  // SettingsController

  @override
  void initState() {
    
    // themeManager.addListener(() {
    //   print("Theme update");
    //   setState(() {});
    // });
    settingsController.addListener(() {
      setState(() {
        // settingsController.initAppSetting();
      });
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ru', ''), // Russian, no country code
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      theme: themeManager.ligth(),
      darkTheme: themeManager.dark(),
      themeMode: themeManager.themeMode,

      routes: {
        SplashView.id: (context) => SplashView(),
        MainView.id: (context) => MainView(),
        HomeView.id: (context) => HomeView(),
        SettingsView.id: (context) => SettingsView(),
        ProfileView.id: (context) => ProfileView(),
      },
      home: SplashView(),
    );
  }
}
