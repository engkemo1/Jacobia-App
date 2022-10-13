import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

import '../../view_model/database/local/cache_helper.dart';
import '../components/ Widget/PlayerRank1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                                CacheHelper.get(key: 'imageUrl')==null?
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/icons/logo.png'),
                                  radius: 30,
                                ):CircleAvatar(
                                  backgroundImage:
                                  NetworkImage(CacheHelper.get(key: 'imageUrl')),
                                  radius: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      CacheHelper.get(key: 'name') == null
                                          ? ''
                                          : CacheHelper.get(key: 'name'),
                                      style: TextStyle(
                                          fontFamily: 'Arial',
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

                            child: StreamBuilder<Object>(
                                stream: FirebaseFirestore.instance
                                    .collection('Results')
                                    .snapshots(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.greenAccent,
                                      ),
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.none) {
                                    return Center(
                                        child: Text(
                                      'لا يوجد نتائج',
                                      style: TextStyle(color: Colors.white),
                                    ));
                                  } else {
                                    return Column(
                                      children: [
                                        SizedBox(height: MediaQuery.of(context).size.height-250,child: ListView.builder(
                                            itemCount: snapshot.data.docs.length,
                                            itemBuilder: (context, index) {
                                              return PlayerRank1(
                                                image: snapshot.data.docs[index]
                                                ['imageUrl'],
                                                name: snapshot.data.docs[index]
                                                ['name'],
                                                prize: snapshot.data.docs[index]
                                                ['prize'].toString(),
                                                score: snapshot.data.docs[index]
                                                ['score'].toString(),
                                                quizName: snapshot.data.docs[index]
                                                ['quizName'],
                                              );
                                            }),),
                                        SizedBox(height: MediaQuery.of(context).size.height*0.01,)
                                      ],
                                    );
                                  }
                                })))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget rank(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50))),
    child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
          )

          // Container(
          //   margin: EdgeInsets.all(20),
          //   padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          //
          //   decoration: BoxDecoration(
          //
          //       borderRadius: BorderRadius.circular(20),
          //       boxShadow: [BoxShadow(
          //         blurRadius: 6,
          //         color: grey
          //       )],
          //       color: Colors.white),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(height: 15,),
          //
          //       Text(
          //         'Last Standing',
          //         style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black,decoration: TextDecoration.none,
          //             fontSize: 20),
          //       ),
          //       SizedBox(height: 15,),
          //       Text(
          //         ''' لعبةالصراحة اسئلة قوية هي لعبة مشهورة تعتمد على مبدأ طرح الأسئلة الصريحة على شخص ما بحيث يكون مجبرًا على الإجابة عن هذه الأسئلة
          //       ''',
          //         style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 15,decoration: TextDecoration.none),
          //       ),
          //       Divider(color: Colors.grey,),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Row(
          //             children: [
          //               Icon(Icons.timer,color: primaryColor,),
          //               Column(
          //                 children: [Text(' 25July/1am',style: TextStyle(color: Colors.black,fontSize: 12,decoration: TextDecoration.none),),
          //                   Text('التوقيت',style: TextStyle(color: Colors.grey,fontSize: 12,decoration: TextDecoration.none),),
          //                 ],
          //               ),
          //
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Icon(Icons.monetization_on_outlined,color: Colors.red,),
          //               Column(
          //                 children: [Text('\$44',style: TextStyle(color: Colors.black,fontSize: 12,decoration: TextDecoration.none),),
          //                   Text(' السعر',style: TextStyle(color: Colors.grey,fontSize: 12,decoration: TextDecoration.none),),
          //                 ],
          //               ),
          //
          //             ],
          //           ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Icon(Icons.stars_rounded,color: Colors.yellow,),
          //               Column(
          //                 children: [Text('رياضه',style: TextStyle(color: Colors.black,fontSize: 12,decoration: TextDecoration.none),),
          //                   Text('النوع',style: TextStyle(color: Colors.grey,fontSize: 12,decoration: TextDecoration.none),),
          //                 ],
          //               ),
          //
          //             ],
          //           )
          //
          //
          //         ],
          //       )
          //
          //     ],
          //   ),
          // ),
        ],
      ),
    ),
  );
}
