import 'package:cloud_firestore/cloud_firestore.dart';

class UsersServices {
  ///Ajoute ou met à jour un utilisateur
  static set(String uid, String email) {
    FirebaseFirestore.instance.collection("users").doc(uid).set(
      {
        'email': email,
      },
      SetOptions(merge: true),
    );
  }
}
