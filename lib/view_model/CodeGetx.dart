import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../model/Code.dart';
import '../model/question model.dart';
import 'database/local/cache_helper.dart';

class CodesGetX extends GetxController with SingleGetTickerProviderMixin {
  // List<Code> codeList = [];
  var docid;

  int? red, yellow, green;
  String typeCoins='none';
  int? withdrawal;
   TextEditingController priceController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  // getCode(int code) async {
  //   var codes = FirebaseFirestore.instance
  //       .collection('codes')
  //       .where('code', isEqualTo: code);
  //   var question = await codes.get();
  //   question.docs.forEach((element) {
  //     docid = element.id;
  //     update();
  //     codeList.add(Code.fromJson(element.data() as Map<String, dynamic>));
  //   });
  //
  //   print(codeList.toString());
  //
  //   return codeList;
  // }

  @override
  void onInit() {
    // TODO: implement onInit
      super.onInit();
  }
void delete(String id)async{

 await FirebaseFirestore.instance.collection('quiz').doc(id).delete();
update();
}
  updateApplied(
    bool applied,
  ) async {
    return await FirebaseFirestore.instance
        .collection('codes')
        .doc(docid)
        .update({'applied': applied});
  }

  checkCode(BuildContext context) async {
    print(CacheHelper.get(key: 'redCoins').toString());

    List<Code> codeList = [];
    var codes = FirebaseFirestore.instance
        .collection('codes')
        .where('code', isEqualTo: codeController.text.toString());
    var question = await codes.get();

    question.docs.forEach((element) {
      docid = element.id;

      codeList.add(Code.fromJson(element.data() as Map<String, dynamic>));

      update();
    });

    if (codeList != null) {
      print('dsasdaasdsda');
      for (var element in codeList) {
        if (element.applied == false) {
          int red = CacheHelper.get(key: 'redCoins') ?? 0;
          int yellow = CacheHelper.get(key: 'yellowCoins') ?? 0;
          int green = CacheHelper.get(key: 'greenCoins') ?? 0;

          FirebaseFirestore.instance
              .collection('users')
              .doc(CacheHelper.get(key: 'uid'))
              .update({
            'redCoins': element.typeCoins == 'Red' ? red + element.price! : red,
            'greenCoins':
                element.typeCoins == 'green' ? green + element.price! : green,
            'yellowCoins': element.typeCoins == 'yellow'
                ? yellow + element.price!
                : yellow,
          }).then((value) {
            element.typeCoins == 'Red'
                ? CacheHelper.put(key: 'redCoins', value: red + element.price!)
                : red;
            element.typeCoins == 'green'
                ? CacheHelper.put(
                    key: 'greenCoins', value: green + element.price!)
                : red;
             element.typeCoins == 'yellow'
                ? CacheHelper.put(
                    key: 'yellowCoins', value: yellow + element.price!)
                : red;
            update();
          });

          updateApplied(true);

          Get.defaultDialog(title: '', content: Text('تمت العمليه بنجاح'));
        } else {
          Get.defaultDialog(title: '', content: Text('الكود غير صحيح'));
        }
      }
    } else
      Get.defaultDialog(title: '', content: Text('الكود غير صحيح'));
  }

  request()async{
  await  FirebaseFirestore.instance.collection('requests').doc(CacheHelper.get(key: 'uid')).set({
      'name':CacheHelper.get(key: 'name'),
      'phone':CacheHelper.get(key: 'phone'),
      'uid':CacheHelper.get(key: 'uid'),
       'withdrawal':priceController.text,
    'typeCoins':typeCoins,
    'redCoins':CacheHelper.get(key: 'redCoins'),
    'greenCoins':CacheHelper.get(key: 'greenCoins'),
    'yellowCoins':CacheHelper.get(key: 'yellowCoins'),

    }).then((value) => Get.snackbar('كيف حالك', 'لقد تم ارسال الطلب في انتظار الموافقه',duration: Duration(seconds: 5)));
  }
}
