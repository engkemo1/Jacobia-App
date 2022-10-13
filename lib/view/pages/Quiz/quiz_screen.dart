import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/Quiz/body.dart';

class QuizScreen extends StatelessWidget {
  final String name;
  final List list;
  final String id;

  const QuizScreen({super.key, required this.name, required this.list, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: SizedBox(),
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:WillPopScope(child:  Body(name: name,list: list,id:id),onWillPop: ()  async{   return await AwesomeDialog(
      context: context,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,

      title: '',

      desc: "هل انتا متاكد من الخروج",
      btnOkColor: Colors.green,
      btnOkOnPress: () {
      exit(0) ;         },
      btnCancelOnPress:(){Navigator.of(context).canPop();},
      btnCancelColor: Colors.red
      ).show();},),
    );
  }
}
