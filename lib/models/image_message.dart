import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttersimplon/models/message.dart';

class ImageMessage extends Message {
  final String imageUrl;

  // ignore: use_super_parameters
  ImageMessage({
    required this.imageUrl,
    required from,
    required createdAt,
  }) : super(createdAt: createdAt, from: from);

  ImageMessage.fromJson(Map<String, Object?> json)
      : this(
          imageUrl: json['imageUrl'].toString(),
          from: json['from'].toString(),
          createdAt: json['createdAt'] as Timestamp,
        );

  @override
  Map<String, Object?> toJson() {
    return {
      'imageUrl': imageUrl,
      'from': from,
      'createdAt': createdAt,
    };
  }
}
