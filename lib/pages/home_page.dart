import 'package:flutter/material.dart';
import 'package:fluttersimplon/app_bar.dart';
import 'package:fluttersimplon/colors.dart';
import 'package:fluttersimplon/drawer.dart';
import 'package:fluttersimplon/models/conversation.dart';
import 'package:fluttersimplon/pages/messages_page.dart';
import 'package:fluttersimplon/services/conversations_service.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';

class HomePage extends StatefulWidget {
  static String name = "/home";

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
      appBar: getAppBar(),
      drawer: getDrawer(context),
      body: FirestoreListView<Conversation>(
        query: ConversationsServices.getAll().orderBy(
          'createdAt',
          descending: true,
        ),
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, snapshot) {
          final conversation = snapshot.data();
          return Column(
            children: [
              InkWell(
                splashColor: kGrey,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MessagesPage(
                        conversationId: conversation.id,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(conversation.from),
                  trailing: const Icon(
                    Icons.arrow_right,
                    size: 40,
                  ),
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
