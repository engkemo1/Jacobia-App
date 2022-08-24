import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jacobia/constants.dart';
import 'package:jacobia/view_model/PickImage.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  @override
  Widget build(BuildContext context) {
    GetImage _controller = Get.put(GetImage());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'البيانات',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: _controller.file != null
                            ? CircleAvatar(
                                radius: 100,
                                backgroundImage: FileImage(
                                  _controller.file!,
                                ))
                            : CircleAvatar(
                                backgroundColor: Colors.black12,
                                radius: 80,
                                child: Center(
                                    child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 80,
                                )),
                              )),
                    InkWell(
                        onTap: () {
                          showAnimatedDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: GestureDetector(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.black,
                                                  size: 35,
                                                ),
                                              ),
                                              Text(
                                                "Camera",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            _controller
                                                .getImage(ImageSource.camera);
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: GestureDetector(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Icon(
                                                  Icons.photo,
                                                  color: Colors.black,
                                                  size: 35,
                                                ),
                                              ),
                                              Text(
                                                "Gallery",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            _controller
                                                .getImage(ImageSource.gallery);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            animationType: DialogTransitionType.size,
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(seconds: 1),
                          );
                        },
                        child: Icon(Icons.edit))
                  ],
                ),
                Container(
                    height: 80,
                    child: Center(
                      child: ListTile(
                          trailing: Text(
                            ': الاسم  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: const Color(0xff00334a),
                              height: 1.5833333333333333,
                            ),
                          ),
                          subtitle: TextFormField(
                            validator: (val) {
validateName(val!);                            },
                            keyboardType: TextInputType.name,
                            style: TextStyle(color: Colors.grey),
                            controller: TextEditingController()
                              ..text = 'Kamal magdy kamal',
                            onChanged: (text) => {},
                            decoration: InputDecoration(
                              hintText: "Kamal Magdy kamal",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: InputBorder.none,
                            ),
                          )),
                    )),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(
                    height: 80,
                    child: Center(
                      child: ListTile(
                          trailing: Text(
                            ': الكنيه  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: const Color(0xff00334a),
                              height: 1.5833333333333333,
                            ),
                          ),
                          subtitle: TextFormField(
                            validator: (val) {
                              validateName(val!);                            },

                            autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.name,
                            style: TextStyle(color: Colors.grey),
                            controller: TextEditingController()..text = 'kemo',
                            onChanged: (text) => {},
                            decoration: InputDecoration(
                              hintText: "nickname",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: InputBorder.none,
                            ),
                          )),
                    )),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(
                    height: 80,
                    child: Center(
                      child: ListTile(
                          trailing: Text(
                            ': رقم الواتساب  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: const Color(0xff00334a),
                              height: 1.5833333333333333,
                            ),
                          ),
                          subtitle: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            validator: (val) {
                              validateMobile(val!);
                            },
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: Colors.grey),
                            controller: TextEditingController()
                              ..text = '01133443233',
                            onChanged: (text) => {},
                            decoration: InputDecoration(
                              hintText: "يجب ان يكون لديك واتساب",
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: InputBorder.none,
                            ),
                          )),
                    )),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(
                  height: 80,
                  child: Center(
                      child: ListTile(
                          trailing: Text(
                            ': مكان الاقامه  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: const Color(0xff00334a),
                              height: 1.5833333333333333,
                            ),
                          ),

                          subtitle: TextFormField(
                            validator: (val) {
                              validateName(val!);                            },

                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: InputBorder.none,
                            ),
                            controller: TextEditingController()..text = 'مصر',
                            onChanged: (text) => {},
                          ))),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(
                  height: 80,
                  child: Center(
                      child: ListTile(
                          trailing: Text(
                            ': الجنسيه  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: const Color(0xff00334a),
                              height: 1.5833333333333333,
                            ),
                          ),
                          subtitle: TextFormField(
                            validator: (val) {
                              validateName(val!);                            },

                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: InputBorder.none,
                            ),
                            controller: TextEditingController()..text = 'مصري',
                            onChanged: (text) => {},
                          ))),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(
                  height: 80,
                  child: Center(
                      child: ListTile(
                          trailing: Text(

                            ': البريد الالكتروني  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: const Color(0xff00334a),
                              height: 1.5833333333333333,
                            ),
                          ),
                          subtitle: TextFormField(
                            validator: (val) {
                              validateEmail(val!);                            },

                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: InputBorder.none,
                            ),
                            controller: TextEditingController()
                              ..text = 'Kemo@gmail.com',
                            onChanged: (text) => {},
                          ))),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(
                  height: 80,
                  child: Center(
                      child: ListTile(
                          trailing: Text(
                            ': الرقم السري  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: const Color(0xff00334a),
                              height: 1.5833333333333333,
                            ),
                          ),
                          subtitle: TextFormField(
                            validator: (val) {
                              validatePassword(val!);                            },

                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(color: Colors.grey),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: InputBorder.none,
                            ),
                            controller: TextEditingController()
                              ..text = '1221212212212',
                            onChanged: (text) => {},
                          ))),
                ),
              ],
            ),
          ],
        )));
  }
}
