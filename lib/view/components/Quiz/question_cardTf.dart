import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../model/question model.dart';
import '../../../view_model/question_controller.dart';
import 'option.dart';

class QuestionCardTF extends StatelessWidget {


  final trueFalse tf;


  QuestionCardTF({  required this.tf,});

  @override
  Widget build(BuildContext context) {
    List tfQ=['True','False'];

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
        tf.question.toString(), style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20 / 2),
         ...List.generate(
            2,
                (index) =>
                Options(
                  index: index,

                  text: tfQ[index],

                  press: () {_controller.checkAnsTf(tf, index);},
                ),
          ),
        ],
      ),
    );
  }
}
