import 'package:flutter/material.dart';
import 'package:jacobia/view/pages/Compettition/Compettition.dart';
import 'package:jacobia/view/pages/Compettition/compettitionDetails.dart';
import 'package:jacobia/view/pages/HomeScreen.dart';

import 'view/components/themes/light_theme.dart';
import 'view/pages/MainScreen.dart';
import 'view/pages/authentication/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      //Here The Theme.
      themeMode: ThemeMode.light,
      home: CompettitionDetails(),
    );
  }
}

