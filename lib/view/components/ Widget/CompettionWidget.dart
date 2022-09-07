import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../pages/Compettition/compettitionDetails.dart';
import '../component.dart';

class CompetitionWidget extends StatelessWidget {
  var docs = FirebaseFirestore.instance.collection('quiz').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: docs,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            );
          } else {
            return SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var snap = snapshot.data.docs;

                    var dateTime1 =
                        DateFormat('d/M/y').parse(snap[index]['date']);

                    return GestureDetector(
                      onTap: () {
                        navigatorScreen(
                            context,
                            CompettitionDetails(
                                docId: snap[index].id,
                                image: snap[index]['imageUrl'],
                                desc: snap[index]['desc'],
                                max: snap[index]['max'],
                                min: snap[index]['min'],
                                price: snap[index]['price'],
                                name: snap[index]['name'],
                                profit: snap[index]['profit'],
                                categories: snap[index]['selected'],
                                r1: snap[index]['Rank1'],
                                r2: snap[index]['Rank2'],
                                r3: snap[index]['Rank3'],
                                r4: snap[index]['Rank4'],
                                r5: snap[index]['Rank5'],
                                r6: snap[index]['Rank6'],
                                r7: snap[index]['Rank7'],
                                r8: snap[index]['Rank8'],
                                r9: snap[index]['Rank9'],
                                r10: snap[index]['Rank10']));
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Align(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                            snap[index]['imageUrl'])),
                                  ),
                                  Container(
                                    width: 180,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.black38),
                                    margin: EdgeInsets.only(
                                        left: 10, top: 10, right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.timer_rounded,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CountDownText(
                                          due: dateTime1,
                                          finishedText: "Done",
                                          showLabel: true,
                                          // daysTextLong: " DAYS ",
                                          // hoursTextLong: " HOURS ",
                                          // minutesTextLong: " MINUTES ",
                                          // secondsTextLong: " SECONDS ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                snap[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'الهدف',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                        fontSize: 15),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'price: ${snap[index]['price']} ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Image.asset(
                                        'assets/images/coin.png',
                                        width: 20,
                                      )
                                    ],
                                  ),
                                  Text(
                                    'الحصول على المركز من 1ل10',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                        fontSize: 14),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
        });
  }
}
