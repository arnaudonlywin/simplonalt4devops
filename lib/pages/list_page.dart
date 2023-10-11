import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttersimplon/widgets/app_bar.dart';

abstract class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  ///Retourne le drawer si besoin
  Widget? getDrawer(BuildContext context) {
    return null;
  }

  ///La liste des éléments
  FirestoreListView getListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      drawer: getDrawer(context),
      body: getListView(),
    );
  }
}
