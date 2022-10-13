import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jacobia/view/components/component.dart';

import '../../../constants.dart';
import '../../components/decoration.dart';
import '../MainScreen.dart';

void main() => runApp(LeaderboardScreen());

class LeaderboardScreen extends StatefulWidget {
  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<Object> names = [];
  List<Object> scores = [];
  List<Object> username = [];
  List<Object> avatar = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DecorationProperties.leaderboardBackgroundDecoration,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          leading: IconButton(
              onPressed: () {
                navigatorAndRemove(context, MainScreen());
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: primaryColor,
              )),
        ),
        backgroundColor: Colors.transparent,
        body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection('').snapshots(),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [FirstPlayer(names, scores, avatar)],
                        ),
                        Positioned(
                          top: 100,
                          left: .0,
                          right: .0,
                          child: Row(
                            children: [
                              Spacer(),
                              SecondPlayer(names, scores, avatar),
                              Spacer(
                                flex: 2,
                              ),
                              ThirdPlayer(names, scores, avatar),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: mainGradient,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      width: MediaQuery.of(context).size.width,
                      height: 68,
                      child: Row(
                        children: [
                          Spacer(),
                          Text('3'),
                          Spacer(),
                          CircleAvatar(
                            radius: 27,
                            backgroundColor: Color(0xffA6BAFC),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.asset('assets/images/man.png'),
                              radius: 21,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Hema",
                            style: GoogleFonts.openSans(
                                color: Color(0xffE8E8E8),
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          Spacer(
                            flex: 5,
                          ),
                          Align(
                              alignment: Alignment.centerRight, child: Text('50')),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 68,
                              color: Color(0xff060718).withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '#${(index + 4).toString()}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        CircleAvatar(
                                          radius: 27,
                                          backgroundColor: Color(0xffA6BAFC),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Image.asset(
                                                'assets/images/man.png'),
                                            radius: 21,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "kemo",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        "100",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

Expanded FirstPlayer(names, scores, avatar) {
  return Expanded(
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CircleAvatar(
                radius: 68,
                backgroundColor: Color(0xffFFE54D),
                child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Color(0xff86A0FA),
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        child: Image.asset('assets/images/man.png'))),
              ),
            ),
            Positioned(
                top: .0,
                left: .0,
                right: .0,
                child: Center(
                    child: CircleAvatar(
                        backgroundColor: Color(0xffFFCC4D),
                        radius: 19,
                        child: CircleAvatar(
                          radius: 15,
                          child: Text(
                            "1",
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                color: Color(0xffF99D26),
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Color(0xffFDE256),
                        ))))
          ],
        ),
        Text(
          'kemo',
          style: GoogleFonts.openSans(
              color: Color(0xffE8E8E8),
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        Text(
          '100',
          style: GoogleFonts.openSans(
              color: Color(0xffE8E8E8),
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ],
    ),
  );
}

Column ThirdPlayer(names, scores, avatar) {
  return Column(
    children: [
      Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xff8B5731),
              child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xffF5A6FC),
                  child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.transparent,
                      child: Image.asset('assets/images/man.png'))),
            ),
          ),
          Positioned(
              top: .0,
              left: .0,
              right: .0,
              child: Center(
                  child: CircleAvatar(
                      radius: 19,
                      backgroundColor: Color(0xff8B5731),
                      child: CircleAvatar(
                        radius: 15,
                        child: Text(
                          "3",
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Color(0xff8B5731),
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Color(0xffBF7540),
                      ))))
        ],
      ),
      Text(
        'Hema',
        style: GoogleFonts.openSans(
            color: Color(0xffE8E8E8),
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
      Text(
        '50',
        style: GoogleFonts.openSans(
            color: Color(0xffE8E8E8),
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
    ],
  );
}

Column SecondPlayer(names, scores, avatar) {
  return Column(
    children: [
      Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xffCED5E0),
              child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xff26CE55),
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 33,
                      child: Image.asset('assets/images/man.png'))),
            ),
          ),
          Positioned(
              top: .0,
              left: .0,
              right: .0,
              child: Center(
                  child: CircleAvatar(
                      backgroundColor: Color(0xffCED5E0),
                      radius: 19,
                      child: CircleAvatar(
                        radius: 15,
                        child: Text(
                          "2",
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Color(0xffB3BAC3),
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Color(0xffEFF1F4),
                      ))))
        ],
      ),
      Text(
        'Reem',
        style: GoogleFonts.openSans(
            color: Color(0xffE8E8E8),
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
      Text(
        '200',
        style: GoogleFonts.openSans(
            color: Color(0xffE8E8E8),
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
    ],
  );
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
        child: Container(
          color: Color(0xff595CFF),
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
    centerTitle: true,
    backgroundColor: Color(0xff14154F),
    elevation: 0,
    title: Text(
      'Liderlik',
    ),
  );
}
