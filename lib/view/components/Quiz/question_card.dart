import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../model/question model.dart';
import '../../../view_model/question_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {

  final Option option;

  final String name;


   QuestionCard({ required this.option, required this.name});

  @override
  Widget build(BuildContext context) {
    List tfQ=['True','False'];
    List optionsQ = [
      option.option1.toString(),
      option.option2.toString(),
      option.option5.toString(),
      option.option4.toString(),
      option.option5.toString()
    ];

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
            option.question.toString(), style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20 / 2),

          ...List.generate(
           option.type=='options'? 5:2,
                (index) =>
                Options(
                  index: index,

                  text: option.type=='options'?optionsQ[index]:tfQ[index],
                  press: () {_controller.checkAns(option, index,name);},
                ),
          )





        ],
      ),
    );
  }
}
