import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../AuthGetX/AuthController.dart';
import '../database/local/cache_helper.dart';

class EnrollGetX extends GetxController {
  enroll(String typeCoins, int price, String name, String docId) async {
    if (typeCoins == 'yellowCoins' &&
            price > CacheHelper.get(key: 'yellowCoins') ||
        typeCoins == 'redCoins' && price > CacheHelper.get(key: 'redCoins') ||
        typeCoins == 'greenCoins' &&
            price > CacheHelper.get(key: 'greenCoins')) {
      Get.snackbar('!تنبيه', 'ليس معك نقود كافية للاشتراك');
    } else {


      await FirebaseFirestore.instance
          .collection('users')
          .doc(CacheHelper.get(key: 'uid'))
          .update({typeCoins: CacheHelper.get(key: typeCoins) - price});

      await FirebaseFirestore.instance
          .collection(name)
          .doc(docId)
          .get()
          .then((value) {
        if (value.exists) {
          FirebaseFirestore.instance
              .collection('total')
              .doc(docId)
              .update({'total': value.get('total') + price});
        }else{
          FirebaseFirestore.instance
              .collection('total')
              .doc(docId)
              .set({'total': price});
        }
      });

      Get.put(AuthController().enrolledQuiz(docId));
    }
  }

  onBeginQuiz(String name,String typeCoins ,String docId,var r1,var r2,var r3,var r4,var r5,var r6,var r7,var r8,var r9,var r10) {


    FirebaseFirestore.instance.collection('name').doc(CacheHelper.get(key: 'uid')).update({
      'isJoined':true
    });
    CacheHelper.put(
        key: 'quizId', value: docId);
    CacheHelper.put(key: 'quiz', value: name);
    CacheHelper.put(
        key: 'typeCoins',
        value: typeCoins);
    CacheHelper.put(
        key: 'Rank1', value: r1);
    CacheHelper.put(
        key: 'Rank2', value: r2);
    CacheHelper.put(
        key: 'Rank3', value: r3);
    CacheHelper.put(
        key: 'Rank4', value: r4);
    CacheHelper.put(
        key: 'Rank5', value: r5);
    CacheHelper.put(
        key: 'Rank6', value: r6);
    CacheHelper.put(
        key: 'Rank7', value: r7);
    CacheHelper.put(
        key: 'Rank8', value: r8);
    CacheHelper.put(
        key: 'Rank9', value: r9);
    CacheHelper.put(
        key: 'Rank10', value: r10);
    CacheHelper.put(
        key: 'typeCoins',
        value: typeCoins);

  }
}
