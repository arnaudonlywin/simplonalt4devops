import 'package:flutter/material.dart';
import 'package:fluttersimplon/colors.dart';
import 'package:fluttersimplon/drawer.dart';
import 'package:fluttersimplon/models/conversation.dart';
import 'package:fluttersimplon/pages/list_page.dart';
import 'package:fluttersimplon/pages/messages_page.dart';
import 'package:fluttersimplon/services/conversations_service.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';

class HomePage extends ListPage {
  static String name = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget? getDrawer(BuildContext context) {
    return getAppDrawer(context);
  }

  @override
  FirestoreListView getListView() {
    return FirestoreListView<Conversation>(
      query: ConversationsServices.getAll().orderBy(
        'lastMessageAt',
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
                title: Text(conversation.name),
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
    );
  }
}
