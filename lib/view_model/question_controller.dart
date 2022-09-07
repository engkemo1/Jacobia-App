import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jacobia/view/pages/Quiz/after_game_screen.dart';
import 'package:jacobia/view/pages/Quiz/leaderboard_screen.dart';
import '../Questions.dart';
import '../model/question model.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  List<Option> options = [];
  List<trueFalse> TrueFalse = [];

  var Q = [];

  getQuestions() async {
    var questions = FirebaseFirestore.instance.collection('question');



    var question = await questions.get();

    var optionsSnapshot = question.docs.forEach((element) {
      options.add(Option.fromJson(element.data() as Map<String, dynamic>));
    });

    print(options);
    return optionsSnapshot;
  }

  getAll() async {
    var questions = FirebaseFirestore.instance.collection('question');
    var question = await questions.get();
    question.docs.forEach((element) {
      Q.add(element);
    });
    print(Q.length);

    return Q;
  }

  // Lets animated our progress bar
  getTrueFalse() async {
    var questions = FirebaseFirestore.instance
        .collection('question')
        .where('type', isEqualTo: 'trueFalse');

    var question = await questions.get();

    var OptionsSnapshot = question.docs.forEach((element) {
      TrueFalse.add(trueFalse.fromJson(element.data() as Map<String, dynamic>));
    });

    print(TrueFalse.toString());

    return OptionsSnapshot;
  }

  AnimationController? _animationController;
  Animation? _animation;

  // so that we can access our animation outside
  Animation? get animation => this._animation;

  PageController? _pageController;

  PageController? get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;

  bool get isAnswered => this._isAnswered;

  int? _correctAns;

  int? get correctAns => this._correctAns;

  int? _selectedAns;

  int? get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  final RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    getAll();
    getTrueFalse();
    getQuestions();
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController?.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController!.dispose();
    _pageController!.dispose();
  }

  void checkAns(Option question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController!.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void checkAnsTf(trueFalse question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController!.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != Q.length) {
      _isAnswered = false;
      _pageController!
          .nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController!.reset();

      // Then start it again
      // Once timer is finish go to the next
      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      if (numOfCorrectAns >= 8) {
        Get.to(AfterGameScreen(score: numOfCorrectAns));
      } else {
        Get.to(LeaderboardScreen());
      }
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
