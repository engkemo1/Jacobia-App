import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jacobia/view/components/component.dart';
import 'package:jacobia/view/pages/HomeScreen.dart';
import 'package:jacobia/view/pages/authentication/login.dart';

import '../../../constants.dart';

class SignUp extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    var currentItem;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              gradient: newVv
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        // #signup_text
                        Text(
                          "انشاء حساب",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white, fontSize: 32.5),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        // #welcome
                        Text(
                          "مرحبا بك",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      // #text_field
                      Container(
                        margin:  EdgeInsets.symmetric(horizontal: 30),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 20,
                                  spreadRadius: 10,
                                  offset:  Offset(0, 10))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "الاسم كامل",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              textAlign: TextAlign.end,

                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "البريد الالكتروني",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              textAlign: TextAlign.end,

                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "رقم الموبايل",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              textAlign: TextAlign.end,

                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "الرقم السري",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            Divider(
                              thickness: 0.5,
                              height: 10,
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),

                      // #signup_button
                      MaterialButton(
                        onPressed: () {
                          navigatorAndRemove(context, HomeScreen());
                        },
                        height: 45,
                        minWidth: 240,
                        shape: const StadiumBorder(),
                        color: secondaryColor,
                        child: const Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      // #text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                        InkWell(child: Text('تسجبل الدحول', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: secondaryColor),)
                          , onTap: () {
                            navigatorAndRemove(context, SignIn());
                          },)
                        , Text(
                        " !لدي حساب بالفعل",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                        ],
                      )
                      , SizedBox(
                        height: 30,
                      ),

                      // #buttons(facebook & github)
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}