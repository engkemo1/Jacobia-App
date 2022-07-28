import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jacobia/view/pages/Compettition/Compettition.dart';
import 'package:jacobia/view/pages/Compettition/compettitionDetails.dart';
import 'package:jacobia/view/pages/HomeScreen.dart';
import 'package:jacobia/view/pages/Quiz/leaderboard_screen.dart';

import 'view/components/themes/light_theme.dart';
import 'view/pages/MainScreen.dart';
import 'view/pages/authentication/login.dart';
import 'view/pages/Quiz/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      //Here The Theme.
      themeMode: ThemeMode.light,
      home: MainScreen(),
    );
  }
}

