import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jacobia/model/question%20model.dart';
import 'package:jacobia/view/components/Quiz/question_cardTf.dart';

import '../../../view_model/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('question').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.greenAccent,),);
          } else{
            return  Stack(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child:
                  Image.asset('assets/images/bg.png', fit: BoxFit.cover),

                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20),
                        child: ProgressBar(),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(
                              () =>
                              Text.rich(

                                TextSpan(
                                  style: TextStyle(color: Colors.white),
                                  text:
                                  "Question ${_questionController.questionNumber
                                      .value}",

                                  children: [
                                    TextSpan(
                                      text: "/${_questionController.questions
                                          .length}",

                                    ),
                                  ],
                                ),
                              ),
                        ),
                      ),
                      Divider(thickness: 1.5),
                      SizedBox(height: 20),
                      Expanded(
                        child: PageView.builder(
                          // Block swipe to next qn
                            physics: NeverScrollableScrollPhysics(),
                            controller: _questionController.pageController,
                            onPageChanged: _questionController.updateTheQnNum,
                            itemCount: _questionController.options.length,
                            itemBuilder: (context, index) {

                              return

                                QuestionCard(

                                option: _questionController.options[index],
                                );


                            }),
                      ),
                    ],
                  ),
                )
              ],
            );
          }

        }
    );

  }
}
