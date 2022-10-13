import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jacobia/constants.dart';
import 'package:jacobia/view_model/PickImage.dart';
import 'package:jacobia/view_model/database/local/cache_helper.dart';
import 'package:path/path.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  _EditInfoState createState() => _EditInfoState();
}


class _EditInfoState extends State<EditInfo> {
  late   TextEditingController nameController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  late TextEditingController numController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController nickController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController nationalityController = TextEditingController();


  var imageFile;
  String? image;

  @override
  void initState() {
    nameController=TextEditingController(text: CacheHelper.get(key: 'name'));
    passController=TextEditingController(text: CacheHelper.get(key: 'password'));
    emailController=TextEditingController(text: CacheHelper.get(key: 'email'));
    nickController=TextEditingController(text: CacheHelper.get(key: 'nick'));
    addressController=TextEditingController(text: CacheHelper.get(key: 'address'));
    nationalityController=TextEditingController(text: CacheHelper.get(key: 'nationality'));
    emailController=TextEditingController(text: CacheHelper.get(key: 'email'));
    numController=TextEditingController(text: CacheHelper.get(key: 'phone'));

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                      child: imageFile != null
                          ? CircleAvatar(
                              radius: 100,
                              backgroundImage: FileImage(
                                imageFile!,
                              ))
                          : CacheHelper.get(key: 'imageUrl') == null
                              ? CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 80,
                                  child: Image.asset('assets/icons/logo.png'))
                              : CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 80,
                                  backgroundImage: NetworkImage(
                                      CacheHelper.get(key: 'imageUrl')),
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
                                        onTap: () async {
                                          try {
                                            final _pickedFile =
                                                await ImagePicker().pickImage(
                                              source: ImageSource.camera,
                                            );

                                            setState(() {
                                              imageFile =
                                                  File(_pickedFile!.path);
                                            });
                                            Get.back();
                                          } catch (error) {
                                            Get.back();
                                          }
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
                                        onTap: () async {
                                          try {
                                            final _pickedFile =
                                                await ImagePicker().pickImage(
                                              source: ImageSource.gallery,
                                              maxHeight: 400,
                                              maxWidth: 400,
                                            );
                                            setState(() {
                                              imageFile =
                                                  File(_pickedFile!.path);
                                            });

                                            Get.back();
                                          } catch (error) {
                                            Get.back();
                                          }
                                          String _fileName =
                                              basename(imageFile!.path);

                                          setState(() {
                                            image = _fileName;
                                          });
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
                            validateName(val!);
                          },
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.grey),
                          controller: nameController,
                          onChanged: (text) => {},
                          decoration: InputDecoration(
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
                          ': الكنية  ',
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
                            validateName(val!);
                          },
                          autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.grey),
                          controller: nickController
                            ,
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
                          controller: numController
                          ,
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
                          ': مكان الاقامة  ',
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
                            validateName(val!);
                          },
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: InputBorder.none,
                          ),
                          controller: addressController
                           ,
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
                          ': الجنسية  ',
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
                            validateName(val!);
                          },
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: InputBorder.none,
                          ),
                          controller: nationalityController
                            ,
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
                            validateEmail(val!);
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: InputBorder.none,
                          ),
                          controller: emailController,
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
                            validatePassword(val!);
                          },
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border: InputBorder.none,
                          ),
                          controller: passController,
                          onChanged: (text) => {},
                        ))),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor),
                      onPressed: () async {
                        String? picUrl;
                        String _fileName = basename(imageFile!.path);
                        Reference _firebaseStorageRef = FirebaseStorage.instance
                            .ref()
                            .child('profilePics/$_fileName');
                        UploadTask _uploadTask =
                            _firebaseStorageRef.putFile((imageFile!));
                        picUrl = await (await _uploadTask).ref.getDownloadURL();
                        setState(() {
                          image = picUrl;
                        });

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(CacheHelper.get(key: 'uid'))
                            .update({
                          'imageUrl': image ?? CacheHelper.get(key: 'imageUrl'),
                          'name': nameController.text.isNotEmpty?nameController.text:CacheHelper.get(key: 'name'),
                          'phone': numController.text.isNotEmpty
                              ? numController.text
                              : CacheHelper.get(key: 'phone'),
                          'nick': nickController.text.isNotEmpty
                              ? nickController.text
                              : CacheHelper.get(key: 'nick'),
                          'nationality': nationalityController.text.isNotEmpty
                              ? nationalityController.text
                              : CacheHelper.get(key: 'nationality'),
                          'address': addressController.text.isNotEmpty
                              ? addressController.text
                              : CacheHelper.get(key: 'address'),
                        }).then((value) {
                          CacheHelper.put(
                              key: 'imageUrl',
                              value: image ?? CacheHelper.get(key: 'imageUrl'));
                          CacheHelper.put(
                            key: 'name',
                            value: nameController.text.isNotEmpty
                                ? nameController.text
                                : CacheHelper.get(key: 'name'),
                          );
                          CacheHelper.put(
                              key: 'email',
                              value: emailController.text.isNotEmpty
                                  ? emailController.text
                                  : CacheHelper.get(key: 'email'));
                          CacheHelper.put(
                              key: 'phone', value: numController.text);
                          CacheHelper.put(
                            key: 'nationality',
                            value: nationalityController.text.isNotEmpty
                                ? nationalityController.text
                                : CacheHelper.get(key: 'nationality'),
                          );
                          CacheHelper.put(
                            key: 'password',
                            value: passController.text.isNotEmpty
                                ? passController.text
                                : CacheHelper.get(key: 'password'),
                          );

                          CacheHelper.put(
                            key: 'address',
                            value: addressController.text.isNotEmpty
                                ? addressController.text
                                : CacheHelper.get(key: 'address'),
                          );
                          CacheHelper.put(
                            key: 'nick',
                            value: nickController.text.isNotEmpty
                                ? nickController.text
                                : CacheHelper.get(key: 'nick'),
                          );
                          Get.snackbar('', 'successfully update');
                        });
                      },
                      child: Text('Save')))
            ],
          ),
        ],
      )),
    );
  }
}
