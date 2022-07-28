import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Questions.dart';
import '../../../constants.dart';
import '../../../view_model/question_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {

  final Question question;

  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20 / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,

              text: question.options[index],

              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
