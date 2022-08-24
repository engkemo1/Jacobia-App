import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PlayerRank1 extends StatelessWidget {
  const PlayerRank1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                       Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/images/man2.jpg',
              fit: BoxFit.contain,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          Align(
            alignment: Alignment(-0.9, -0.7),
            child: Container(
              height: 30,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Center(
                child: Text(
                  'kamal magdy',
                  style: TextStyle(
                    fontFamily: 'roboto',
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(1, 0.8),
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Center(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10),
                            color: Colors.black12),
                        child: Text(
                          'رياضيات',
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'roboto',
                              color: Colors.black,
                              decoration:
                              TextDecoration.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10),
                            color: Colors.black12),
                        child: Text(
                          'LastStanding',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              decoration:
                              TextDecoration.none),
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Rank()

        ],
      ),
    );

  }
}

Widget Rank(){

  return              Align(
    alignment: Alignment(-0.9, 0.7),
    child: Container(
      height: 80,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child:

      Stack(
        children: [
          Center(
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    '1',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    'st',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ],
              )),
          Align(
            alignment: Alignment(-0.01, 1.4),
            child: Container(
              height: 30,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red),
              child:


              Center(
                  child: Icon(
                    FontAwesomeIcons.trophy,
                    color: Colors.white,
                    size: 15,
                  )),
            ),
          ),
          Container(child:
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
              ],
            ),
          )
              ,)
        ],
      ),
    ),
  );


}