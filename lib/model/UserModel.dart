import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? profilePhoto;
  final String? email;
  final String? uid;
  final String? phone;
  final String? nick;
 final String? nationality;
  final String? address;


  UserModel(
      {required this.name,
        required this.email,
        required this.uid,
         this.profilePhoto,
         this.phone, this.nick, this.nationality, this.address,

      });

  Map<String, dynamic> toJson() => {
    "name": name,
    "profilePhoto": profilePhoto,
    "email": email,
    "uid": uid,
    'phone':phone,
    'nick':nick,
    'nationality':nationality,
    'address':address
  };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      phone:snapshot['phone'],
      nationality:snapshot['nationality'],
      nick:snapshot['nick'],
      address:snapshot['address'],

    );
  }
}