import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationsServices {
  static Future getAll() {
    return FirebaseFirestore.instance.collection('conversations').get();
  }
}
