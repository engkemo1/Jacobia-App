import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jacobia/view_model/database/local/cache_helper.dart';
import '../../../constants.dart';

class CompettitionDetails extends StatefulWidget {
  final String desc;
  final String image;
  final String docId;
  final int max;
  final int min;
  final int price;
  final int profit;
  final String name;
  final List categories;
  final int? r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;

  const CompettitionDetails({
    super.key,
    required this.desc,
    required this.max,
    required this.min,
    required this.price,
    required this.profit,
    required this.name,
    required this.categories,
    required this.image,
    required this.r1,
    required this.r2,
    required this.r3,
    required this.r4,
    required this.r5,
    required this.r6,
    required this.r7,
    required this.r8,
    required this.r9,
    required this.r10,
    required this.docId,
  });

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
                               CacheHelper.get(key: 'name')??'',
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
                                            padding: const EdgeInsets.all(0.0),
                                            child: Center(
                                              child: Text(
                                                '1',
                                                style: TextStyle(fontSize: 10),
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
                child: SingleChildScrollView(
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
                                  child: Image.network(widget.image),
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
                                  widget.desc,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 14,
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
                                        Text(
                                          'price:  ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          '${widget.price} ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        Image.asset(
                                          'assets/images/coin.png',
                                          width: 15,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        width: 200,
                                        child: ExpansionTile(
                                          title: Text(
                                            'Ranks profit:',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Rank1: ${widget.r1}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                                Text('Rank2: ${widget.r2}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                                Text('Rank3: ${widget.r3}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('Rank4: ${widget.r4}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                                Text('Rank5: ${widget.r5}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                                Text('Rank6: ${widget.r6}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('Rank7: ${widget.r7}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                                Text('Rank8: ${widget.r8}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                                Text('Rank9: ${widget.r9}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Rank10: ${widget.r10}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Categories: ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    Row(
                                      children: List.generate(
                                          widget.categories.length,
                                          (index) => Text(
                                                '   ${widget.categories[index]}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                    )
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
                                    accentColor: Colors.transparent,
                                    colorScheme: ColorScheme.light(
                                      primary: Colors.transparent,
                                    )),
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
                                              Row(
                                                children: [
                                                  Text('Join The Callenge'),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(widget.price.toString()),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Image.asset(
                                                    'assets/images/coin.png',
                                                    height: 15,
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                    Step(
                                      title: Text('Step 2'),
                                      content: Text(
                                          'you should be in rank1 to 10 to win '),
                                    ),
                                  ],
                                ),
                              )),
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black26,
                                    maximumSize: Size(200, 100),
                                    fixedSize: Size(160, 30),
                                    minimumSize: Size(20, 40)),
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: const Text('Are you sure'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(
                                                  'Your Balance will reduce ${widget.price}'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Yes'),
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(CacheHelper.get(
                                                      key: 'uid'))
                                                  .collection('enrolled_quiz').doc("${widget.docId}")
                                                  .set({
                                                'id': widget.docId
                                              }).then((value) {
                                                Navigator.pop(context);

                                              })  ;
                                              Get.defaultDialog(content: Text('Enrolled'),title: '');

                                            },
                                          ),
                                          TextButton(
                                            child: const Text('No'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text('Enroll')),
                          ),
                          // Padding(
                          //   padding:
                          //       EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          //   child: Text(
                          //     'More Challengs',
                          //     textAlign: TextAlign.start,
                          //     style: TextStyle(
                          //         fontSize: 18,
                          //         fontFamily: 'Arial',
                          //         fontWeight: FontWeight.normal,
                          //         decoration: TextDecoration.none,
                          //         color: Colors.white),
                          //   ),
                          // ),
                          // CompetitionWidget(),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
