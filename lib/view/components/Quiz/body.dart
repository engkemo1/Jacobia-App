import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../view_model/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';
class Body extends StatelessWidget {
  final String name;
  final List list;
  final String id;

  const Body({super.key, required this.name, required this.list, required this.id});

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
      decoration: BoxDecoration(
          gradient: newVv
      ),
      child: FutureBuilder(
          future: _questionController.getQuestions(list),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.greenAccent,
                ),
              );
            } else {
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset('assets/icons/logo.png', ),
                  ),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ProgressBar(),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: GetBuilder<QuestionController>(
                           builder:(_)=> Text.rich(
                              TextSpan(
                                style: TextStyle(color: Colors.white),
                                text:
                                    "Question ${_questionController.questionNumber}",
                                children: [
                                  TextSpan(
                                    text:
                                        "/${_questionController.options.length}",
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
                                return QuestionCard(
                                  name: name,
                                  id:id,
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
          }),
    );
  }
}
