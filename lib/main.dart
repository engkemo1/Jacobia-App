import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jacobia/view_model/AuthGetX/AuthController.dart';
import 'package:jacobia/view_model/question_controller.dart';
import 'view/components/themes/light_theme.dart';
import 'view/pages/authentication/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  Get.put(QuestionController());


  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme(context),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      //Here The Theme.
      home: SignIn(),
    );
  }
}
