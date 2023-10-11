import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttersimplon/models/conversation.dart';

class ConversationsServices {
  ///Retourne les conversations
  static CollectionReference<Conversation> getAll() {
    final collectionRef =
        FirebaseFirestore.instance.collection('conversations');
    return collectionRef.withConverter<Conversation>(
      fromFirestore: (snapshot, _) =>
          Conversation.fromJson(snapshot.id, snapshot.data()!),
      toFirestore: (conversation, _) => conversation.toJson(),
    );
  }

  static Future<void> updateLastMessageAt(
    String conversationId,
    Timestamp lastMessageAt,
  ) async {
    final docRef = FirebaseFirestore.instance
        .collection('conversations')
        .doc(conversationId);
    return docRef.set(
      {'lastMessageAt': lastMessageAt},
      SetOptions(merge: true),
    );
  }
}
