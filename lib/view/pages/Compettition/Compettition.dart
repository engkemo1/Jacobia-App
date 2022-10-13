import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jacobia/view_model/AuthGetX/AuthController.dart';
import '../../../constants.dart';
import '../../../view_model/database/local/cache_helper.dart';
import '../../components/ Widget/CompettionWidget.dart';

class Competition extends StatelessWidget {
  var auth = Get.put(AuthController());

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
                            CacheHelper.get(key: 'name')==null ?'': CacheHelper.get(key: 'name').toString(),
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding:
                      //       EdgeInsets.only(left: 20, top: 20, right: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Text(
                      //         'المسابقات المنضمة',
                      //         style: TextStyle(
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.white),
                      //         textAlign: TextAlign.end,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // StreamBuilder<Object>(
                      //     stream: FirebaseFirestore.instance
                      //         .collection('users')
                      //         .doc(CacheHelper.get(key: 'uid'))
                      //         .collection('enrolled').snapshots(),
                      //     builder: (context,AsyncSnapshot snapshot) {
                      //       if(snapshot.connectionState==ConnectionState.waiting){
                      //         return Center(child: CircularProgressIndicator(),);
                      //       }else if(snapshot.data==null){
                      //         return Center(child: Text('لا يوجد مسابقات منضمه'),);
                      //
                      //       }else
                      //       return SizedBox(
                      //         height: 150,
                      //         child: ListView.builder(
                      //           scrollDirection: Axis.vertical,
                      //           itemCount:0,
                      //           itemBuilder: (context,index) {
                      //             return JoinedRacesWidget(docid:snapshot.data.docs[index]['id']);
                      //           }
                      //         ),
                      //       );
                      //     }),

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
                      Expanded(
                        child: CompetitionWidget(),
                      ),

                    ],
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
