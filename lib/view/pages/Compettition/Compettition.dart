import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:jacobia/view/components/component.dart';

import '../../../constants.dart';
import '../../components/ Widget/CompettionWidget.dart';
import '../../components/ Widget/FinishedRaces.dart';
import '../../components/ Widget/JoinedRaces.dart';
import 'compettitionDetails.dart';

class Competition extends StatelessWidget {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 100000;

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(gradient: newVv),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/man.png'),
                              radius: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'kamal magdy',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      decoration: TextDecoration.none),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white70,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                child: Stack(
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      color: primaryColor,
                                      size: 30,
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
                                                color: Colors.white, width: 1)),
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'المسابقات المنضمة',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ),
                        JoinedRacesWidget(),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'المسابقات',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 400,
                          child: CompetitionWidget(),
                        ),
                        SizedBox(
                          height: 200,
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
    );
  }
}
