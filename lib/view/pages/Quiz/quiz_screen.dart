import 'package:flutter/material.dart';
import '../../components/Quiz/body.dart';

class QuizScreen extends StatelessWidget {
  final String name;
  final List list;

  const QuizScreen({super.key, required this.name, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: Body(name: name,list: list,),
    );
  }
}
