import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class FinishedRacesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return                                              Container(
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
            child: ClipRRect(
              child: Image.asset(
                'assets/images/2.jfif',
                height: 100,
                width: 100,
              ),
              borderRadius: BorderRadius.circular(20),
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
              Text(
                '40 عضو',
                style: TextStyle(color: Colors.white,fontSize:13),
                textAlign: TextAlign.end,
              ),
            ],
          )
        ],
      ),
    );


  }
}
