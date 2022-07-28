import 'package:flutter/material.dart';
import 'package:jacobia/view/components/component.dart';

import '../../../constants.dart';
import '../../components/ Widget/CompettionWidget.dart';
import '../Quiz/quiz_screen.dart';

class CompettitionDetails extends StatefulWidget {
  const CompettitionDetails({Key? key}) : super(key: key);

  @override
  State<CompettitionDetails> createState() => _CompettitionDetailsState();
}

class _CompettitionDetailsState extends State<CompettitionDetails> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(gradient: newVv),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // #signup_text
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 45,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white70,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: primaryColor,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'LastStanding',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Arial'),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 45,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white70,
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Icon(
                                          Icons.notifications,
                                          color: primaryColor,
                                          size: 25,
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(top: 5),
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffc32c37),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Center(
                                                child: Text(
                                                  '1',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black54,
                            ),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Image.asset('assets/images/c.jpg'),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'What to do:',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'the act or process of competing : rivalry: such as. a : the effort of two or more parties acting independently to secure the business of a third party by offering the most favorable terms contractors in competition for the contract to build the new school',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Divider(
                                      thickness: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('price:  ',style: TextStyle(color: Colors.white),),
                                        Text('200  '),
                                        Image.asset(
                                          'assets/images/coin.png',
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Earning:  ',style: TextStyle(color: Colors.white)),
                                        Text('1000  '),
                                        Image.asset(
                                          'assets/images/coin.png',
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Text('Questions: ',style: TextStyle(color: Colors.white),),
                                    Text('20')
                                  ],
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'How can i win',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Theme(
                                data: ThemeData(
                                    accentColor: Colors.black12,
                                    colorScheme: ColorScheme.light(
                                        primary: Colors.black54)),
                                child: Stepper(
                                  currentStep: _index,
                                  onStepCancel: () {
                                    if (_index > 0) {
                                      setState(() {
                                        _index -= 1;
                                      });
                                    }
                                  },
                                  onStepContinue: () {
                                    if (_index <= 0) {
                                      setState(() {
                                        _index += 1;
                                      });
                                    }
                                  },
                                  onStepTapped: (int index) {
                                    setState(() {
                                      _index = index;
                                    });
                                  },
                                  steps: <Step>[
                                    Step(
                                      title: const Text('Step 1 '),
                                      content: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text('Join The Callenge'),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('200'),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                      Image.asset(
                                                        'assets/images/coin.png',
                                                        height: 20,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {

                                                    showDialog<void>(
                                                      context: context,
                                                      barrierDismissible: false, // user must tap button!
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                          title: const Text('Are you sure'),
                                                          content: SingleChildScrollView(
                                                            child: ListBody(
                                                              children: const <Widget>[
                                                                Text('Your Balance will reduce 200'),
                                                              ],
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: const Text('Yes'),
                                                              onPressed: () {
                                                                navigatorAndRemove(context, QuizScreen());
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: const Text('No'),
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),

                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text('Join now'))
                                            ],
                                          )),
                                    ),
                                    const Step(
                                      title: Text('Step 2'),
                                      content: Text('Content for Step 2'),
                                    ),
                                    Step(
                                      title: Text('Step 3'),
                                      content: Text('Content for Step 2'),
                                    ),
                                  ],
                                ),
                              )),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 20, bottom: 10),
                            child: Text(
                              'More Challengs',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  color: Colors.white),
                            ),
                          ),
                          CompetitionWidget(),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
