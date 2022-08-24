

import 'dart:io';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

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
}