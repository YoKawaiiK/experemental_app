import 'dart:async';

import 'package:experemental_app/src/views/main_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  static const String id = "SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(MainView.id));
        // () => Navigator.of(context).pushReplacementNamed(PageTransition));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Text(
        AppLocalizations.of(context)!.splashViewDescription,
        
      )),
    );
  }
}
