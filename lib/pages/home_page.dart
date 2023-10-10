import 'package:flutter/material.dart';
import 'package:fluttersimplon/models/conversation.dart';
import 'package:fluttersimplon/services/conversations_service.dart';
import 'package:fluttersimplon/styles.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Image.asset("assets/logo.png"),
            ),
            const Text(
              "Messagerie Simplon",
              style: appBarTitle,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 36, 97, 137),
      ),
      body: FirestoreListView<Conversation>(
        query: ConversationsServices.getAll(),
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, snapshot) {
          final conversation = snapshot.data();
          return Column(
            children: [
              Text(conversation.from),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
