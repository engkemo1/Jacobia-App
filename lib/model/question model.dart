class Option {
   String? answer;
  String? type;

   List? selected;
   String? option1;
   String? option2;
   String? option3;
   String? option4;
   String? option5;

   String? question;

  Option(
      {required this.answer, required this.option1, required this.option2, required this.option3, required this.option4, required this.option5, required this.selected, required this.type, required this.question});

  Option.fromJson(Map<dynamic, dynamic> map) {
    type = map['type'];
    option1 = map['option1'];
    answer = map['answer'];
    option2 = map['option2'];
    option3 = map['option3'];
    option4 = map['option4'];
    option5 = map['option5'];
    question = map['question'];

  }

}

class  trueFalse {
  bool? answer;
  String? type;

  List? selected;


  String? question;

  trueFalse(
      {required this.answer, required this.selected, required this.type, required this.question});

  trueFalse.fromJson(Map<dynamic, dynamic> map) {
    type = map['type'];
    answer = map['answer'];
    question = map['question'];
    selected=map['selected'];

  }

}
