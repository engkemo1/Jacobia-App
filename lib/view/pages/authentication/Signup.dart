import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:jacobia/view/pages/authentication/login.dart';
import '../../../constants.dart';
import '../../../view_model/AuthGetX/AuthController.dart';
import '../../components/component.dart';

class SignUp extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nickController = TextEditingController();
  final TextEditingController addrController = TextEditingController();
  final TextEditingController natioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: newVv),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:  [
                      Image.asset('assets/icons/logo.png',height: MediaQuery.of(context).size.height*0.3,width: MediaQuery.of(context).size.width*0.3,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// LOGIN TEXT
                          Text(
                            'تسجيل الدخول',
                            style: TextStyle(color: Colors.white, fontSize: 25.5),
                            textAlign: TextAlign.end,
                          ),

                          Text(
                            "مرحبا بك",
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),],
                      ),

                      /// WELCOME

                    ],
                  ),
                )),
            Expanded(
              flex: 5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      // #text_field
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 20,
                                  spreadRadius: 10,
                                  offset: Offset(0, 10))
                            ]),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                validator: (val) {
                                  validateName(val!);
                                },
                                keyboardType: TextInputType.name,
                                controller: nameController,
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
                              TextFormField(
                                validator: (val) {

                                  validateEmail(val!);
                                },
                                textAlign: TextAlign.end,
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
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
                              TextFormField(
                                validator: (val) {
                                  validatePassword(val!);
                                },
                                keyboardType: TextInputType.visiblePassword,
                                controller: passController,
                                textAlign: TextAlign.end,
                                obscureText: true,
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
                              TextFormField(
                                validator: (val) {
                                  validateMobile(val!);
                                },
                                keyboardType: TextInputType.phone,
                                controller: numController,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "رقم الواتساب",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              Divider(
                                thickness: 0.5,
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  validateName(val!);
                                },
                                keyboardType: TextInputType.name,
                                controller: nickController,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "الكنية",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              Divider(
                                thickness: 0.5,
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  validateName(val!);
                                },
                                keyboardType: TextInputType.text,
                                controller: addrController,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "مكان الاقامة",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              Divider(
                                thickness: 0.5,
                                height: 10,
                              ),
                              TextFormField(
                                validator: (val) {
                                  validateName(val!);
                                },
                                keyboardType: TextInputType.text,
                                controller: natioController,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "الجنسية",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                              Divider(
                                thickness: 0.5,
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),

                      // #signup_button

                      GetBuilder<AuthController>(
                        builder: (_) {
                          return MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate())
                                controller.registerUser(
                                    nameController.text,
                                    emailController.text,
                                    passController.text,
                                    numController.text,
                                    nickController.text,
                                    natioController.text,
                                    addrController.text);
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
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      // #text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text(
                              'تسجبل الدحول',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor),
                            ),
                            onTap: () {
                              navigatorAndRemove(context, SignIn());
                            },
                          ),
                          Text(
                            " !لدي حساب بالفعل",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      // #buttons(facebook & github)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            height: 45,
                            minWidth: 140,
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.facebook),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: const StadiumBorder(),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            height: 45,
                            minWidth: 140,
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.google),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
