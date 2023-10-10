import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttersimplon/services/conversations_service.dart';
import 'package:fluttersimplon/styles.dart';

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
      body: const Center(
        child: FirebaseMessage(),
      ),
    );
  }
}

class FirebaseMessage extends StatelessWidget {
  const FirebaseMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ConversationsServices.getAll(),
      builder: getBuilder,
    );
  }

  Widget getBuilder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return const Text("Quelque chose s'est mal passé");
    }
    if (snapshot.hasData && !snapshot.data!.exists) {
      return const Text("Le document n'existe pas");
    }
    if (snapshot.connectionState == ConnectionState.done) {
      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
      return Text(data["title"]);
    }
    return const Text("Chargement en cours");
  }
}
