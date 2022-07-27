import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jacobia/view/components/component.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../HomeScreen.dart';
import '../MainScreen.dart';
import 'Signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = 'lesson';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void fireToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  void fireToast2(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade900,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

           gradient: newVv
          ),

        child: Column(
          children: [
            /// Login & Welcome back
            Container(
              height: 210,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  /// LOGIN TEXT
                  Text('تسجبل الدخول', style: TextStyle(color: Colors.white, fontSize: 32.5),textAlign: TextAlign.end,),
                  SizedBox(height: 7.5),
                  /// WELCOME
                  Text('مرحبا بعودتك', style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.end,),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        /// Text Fields
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 20,
                                    spreadRadius: 10,
                                    offset: const Offset(0, 10)
                                ),
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              /// EMAIL
                              TextField(
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: 'البريد الالكتروني',
                                    isCollapsed: false,
                                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey,)
                                    ,
                                ),
                              ),
                              Divider(color: Colors.black54, height: 1),
                              /// PASSWORD
                              TextField(
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: 'الرقم السري',
                                    isCollapsed: false,
                                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey)
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),
                        /// LOGIN BUTTON
                        MaterialButton(
                          onPressed: (){navigatorAndRemove(context, MainScreen());},
                          height: 45,
                          minWidth: 240,
                          child: const Text('تسجيل الدخول', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          textColor: Colors.white,
                          color: secondaryColor,
                          shape: const StadiumBorder(),
                        ),
                        const SizedBox(height: 25),
                        /// TEXT
                        Row(mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            InkWell(child:  Text('انشاء حساب',style: TextStyle(color: secondaryColor,fontWeight: FontWeight.bold),),onTap: (){
                              navigatorAndRemove(context, SignUp());
                            },),

                            Text('  !ليس لدي حساب',style: TextStyle(color: Colors.black),),
                        ],),
                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              onPressed: (){},
                              height: 45,
                              minWidth: 140,
                              child: Row( children: [
                                Icon(FontAwesomeIcons.facebook),
                                SizedBox(width: 10,),
                                Text('Facebook', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                              ],),
                              textColor: Colors.white,
                              color: Colors.blue,
                              shape: const StadiumBorder(),
                            ),
                            MaterialButton(
                              onPressed: (){},
                              height: 45,
                              minWidth: 140,
                              child: Row(children: [
                                Icon(FontAwesomeIcons.google),
                                SizedBox(width: 10,),
                                Text('Google', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),

                              ],),
                              textColor: Colors.white,
                              color: Colors.red,
                              shape: const StadiumBorder(),
                            ),
                          ],
                        ),
                        /// Rich Text & Toast
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
