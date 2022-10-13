

import 'dart:io';
import 'dart:math';

import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jacobia/view_model/database/local/cache_helper.dart';

class GetImage extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    file;
  }
   File? file;

  Future getImage(ImageSource select) async {
    var pickedFile = await ImagePicker.platform.pickImage(source: select);

    if (pickedFile != null) {
      print("file picked");

      file = File(pickedFile.path);




    }
    else{
      print("File not picked");
    }
    update;

  }

  File? imageFile;
  String? picUrl;

  // cameraImage() async {
  //   final _pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     maxHeight: 400,
  //     maxWidth: 400,
  //   );
  //   imageFile = File(_pickedFile!.path);
  //   update();
  // }
  //
  // galleryImage() async {
  //   final _pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxHeight: 400,
  //     maxWidth: 400,
  //   );
  //   imageFile = File(_pickedFile!.path);
  //   update();
  // }

  uploadImageToFirebase() async {
    print('ddddddddddddddddddddddddddddddddddddddddddddddddddd');
    String _fileName = basename(file!.path);
    Reference _firebaseStorageRef =
    FirebaseStorage.instance.ref().child('profilePics/$_fileName');
    UploadTask _uploadTask = _firebaseStorageRef.putFile(file!);
    picUrl = await (await _uploadTask).ref.getDownloadURL();
    print(picUrl);
    CacheHelper.put(key: 'image', value: picUrl);
  }

}