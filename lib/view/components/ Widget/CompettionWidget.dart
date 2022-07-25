import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CompetitionWidget extends StatelessWidget {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 100000;
  void onEnd() {
    print('onEnd');
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return                         Container(
      margin: EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.black45,

        borderRadius: BorderRadius.circular(20),

      ),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                Align(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Image.asset('assets/images/c.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,top:10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.access_time),
                      CountdownTimer(
                        endTime: endTime,
                        onEnd: onEnd,
                      ),

                    ],
                  ),
                ),



              ],
            ),

          ),

          Padding(
            padding: EdgeInsets.only(left: 15,top: 10),
            child: Text(
              'Last Standing',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,decoration: TextDecoration.none,
                  fontSize: 18),textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الهدف',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,decoration: TextDecoration.none,
                      fontSize: 15),textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20,bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'الحصول على المركز االاول',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,decoration: TextDecoration.none,
                      fontSize: 14),textAlign: TextAlign.end,
                ),
              ],
            ),
          ),


        ],
      ),
    );

  }
}
