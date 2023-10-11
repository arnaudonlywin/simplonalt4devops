import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttersimplon/app_bar.dart';
import 'package:fluttersimplon/drawer.dart';
import 'package:fluttersimplon/models/message.dart';
import 'package:fluttersimplon/services/messages_service.dart';

class MessagesPage extends StatefulWidget {
  final String conversationId;

  const MessagesPage({
    Key? key,
    required this.conversationId,
  }) : super(key: key);
  @override
  State<MessagesPage> createState() {
    return _MessagesPageState();
  }
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      drawer: getDrawer(context),
      body: FirestoreListView<Message>(
        reverse: true,
        query: MessagesServices.getAll(widget.conversationId).orderBy(
          'createdAt',
          descending: true,
        ),
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, snapshot) {
          final message = snapshot.data();
          return Column(
            children: [
              Text(message.text),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
