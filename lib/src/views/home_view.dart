import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static String id = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home"),
    );
  }
}
