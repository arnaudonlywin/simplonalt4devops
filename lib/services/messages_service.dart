import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttersimplon/models/message.dart';

class MessagesServices {
  static CollectionReference<Message> getAll(String conversationId) {
    final collectionRef = FirebaseFirestore.instance
        .collection('conversations')
        .doc(conversationId)
        .collection('messages');
    return collectionRef.withConverter<Message>(
      fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!),
      toFirestore: (message, _) => message.toJson(),
    );
  }
}
