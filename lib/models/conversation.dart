import 'package:cloud_firestore/cloud_firestore.dart';

class Conversation {
  Conversation({
    required this.id,
    required this.name,
    required this.between,
    required this.lastMessageAt,
  });
  Conversation.fromJson(String id, Map<String, Object?> json)
      : this(
          id: id,
          name: json['name'] as String,
          between: List<String>.from(json['between'] as List),
          lastMessageAt: json['lastMessageAt'] as Timestamp,
        );

  final String id;
  final String name;
  final List<String> between;
  final Timestamp lastMessageAt;

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'between': between,
      'lastMessageAt': lastMessageAt,
    };
  }
}
