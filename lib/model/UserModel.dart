  import 'package:cloud_firestore/cloud_firestore.dart';

  class UserModel {
    final String? name;
    final String? profilePhoto;
    final String? email;
    final String? uid;
    final String? phone;
    final String? nick;
    final String? pass;

    final String? nationality;
    final String? address;
    final int? greenCoins;
    final int? redCoins;
    final int? yellowCoins;



    UserModel({required this.pass,

      required this.greenCoins, required this.redCoins,required  this.yellowCoins,
        required this.name,
          required this.email,
          required this.uid,
           this.profilePhoto,
           this.phone, this.nick, this.nationality, this.address,

        });

    Map<String, dynamic> toJson() => {
      'password':pass,
      "name": name,
      "imageUrl": profilePhoto,
      "email": email,
      "uid": uid,
      'phone':phone,
      'nick':nick,
      'nationality':nationality,
      'address':address,
      'redCoins':redCoins,
      'greenCoins':greenCoins,
      'yellowCoins':yellowCoins


    };

    static UserModel fromSnap(DocumentSnapshot snap) {
      var snapshot = snap.data() as Map<String, dynamic>;
      return UserModel(
        pass:snapshot['password'],
        email: snapshot['email'],
        profilePhoto: snapshot['profilePhoto'],
        uid: snapshot['uid'],
        name: snapshot['name'],
        phone:snapshot['phone'],
        nationality:snapshot['nationality'],
        nick:snapshot['nick'],
        address:snapshot['address'], greenCoins: snapshot['greenCoins'], redCoins: snapshot['redCoins'], yellowCoins:snapshot['yellowCoins'],

      );
    }
  }