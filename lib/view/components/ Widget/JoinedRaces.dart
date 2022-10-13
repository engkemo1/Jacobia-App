import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class JoinedRacesWidget extends StatelessWidget {
final String docid;

  const JoinedRacesWidget({super.key, required this.docid});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return

      StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('quiz')
            .doc(docid)
           .snapshots(),
        builder: (context,AsyncSnapshot snapshot) {
          return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.only(top: 10, bottom: 10,right: 10),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        snapshot.data.docs['imageUrl'].toString(),
                        height: 100,
                        width: 100,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black54),
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 2, bottom: 2),
                      margin: EdgeInsets.only(
                          left: 4, right: 4, top: 4, bottom: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          Text(
                            'تم الانضمام',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(

                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الحصول علي مركز من المراكز العشره',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.end,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: size.width * 0.5,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black,
                      value: 0.3,
                      color: Colors.white,
                      semanticsLabel: 'Linear progress indicator',
                    ),


                  ),

                ],
              )
            ],
          ),
    );
        }
      );


  }
}
