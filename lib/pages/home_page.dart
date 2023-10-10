import 'package:flutter/material.dart';
import 'package:fluttersimplon/colors.dart';
import 'package:fluttersimplon/models/conversation.dart';
import 'package:fluttersimplon/services/conversations_service.dart';
import 'package:fluttersimplon/styles.dart';
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
      appBar: _getAppBar(),
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
                onTap: () {},
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

  ///Retourne l'app bar de mon application
  PreferredSizeWidget _getAppBar() {
    return AppBar(
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
      backgroundColor: kBlue,
    );
  }
}
