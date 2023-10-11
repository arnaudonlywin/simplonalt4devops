import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttersimplon/models/message.dart';
import 'package:fluttersimplon/pages/list_page.dart';
import 'package:fluttersimplon/services/messages_service.dart';
import 'package:fluttersimplon/widgets/message_widget.dart';

class MessagesPage extends ListPage {
  final String conversationId;

  const MessagesPage({
    Key? key,
    required this.conversationId,
  }) : super(key: key);

  @override
  FirestoreListView getListView() {
    return FirestoreListView<Message>(
      reverse: true,
      query: MessagesServices.getAll(conversationId).orderBy(
        'createdAt',
        descending: true,
      ),
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, snapshot) {
        final message = snapshot.data();
        return MessageWidget(message: message);
      },
    );
  }
}
