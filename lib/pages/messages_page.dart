import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttersimplon/colors.dart';
import 'package:fluttersimplon/models/conversation.dart';
import 'package:fluttersimplon/models/message.dart';
import 'package:fluttersimplon/pages/list_page.dart';
import 'package:fluttersimplon/services/messages_service.dart';
import 'package:fluttersimplon/styles.dart';
import 'package:fluttersimplon/widgets/message_widget.dart';

class MessagesPage extends ListPage {
  final Conversation conversation;

  const MessagesPage({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  @override
  Widget getTitle() {
    return Text(
      conversation.name,
      style: appBarTitle,
    );
  }

  @override
  Widget getBody() {
    return Column(
      children: [
        Expanded(
          child: FirestoreListView<Message>(
            reverse: true,
            query: MessagesServices.getAll(conversation.id).orderBy(
              'createdAt',
              descending: true,
            ),
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, snapshot) {
              final message = snapshot.data();
              return MessageWidget(message: message);
            },
          ),
        ),
        InputBottomAppBar(conversation: conversation),
      ],
    );
  }
}

class InputBottomAppBar extends StatefulWidget {
  final Conversation conversation;

  const InputBottomAppBar({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  @override
  State<InputBottomAppBar> createState() => _InputBottomAppBarState();
}

class _InputBottomAppBarState extends State<InputBottomAppBar> {
  final textMessageController = TextEditingController();

  @override
  void dispose() {
    textMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10.0,
      surfaceTintColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //Bouton "+" pour ajouter du contenu au message
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                controller: textMessageController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  hintText: "Ecrire un message...",
                  hintStyle: const TextStyle(color: kGrey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            //Bouton envoi du message
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              mini: true,
              onPressed: _sendMessage,
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Envoi le message au destinataire
  _sendMessage() {
    String textMessage = textMessageController.text.trim();
    if (textMessage.isNotEmpty) {
      /* MessagesService.sendMessage(
        conversation: widget.conversation,
        senderUserId: UserService.getCurrentUserID(),
        textMessage: _textMessage,
        fromProAccount: widget.isAppPro,
        //On récupère le current establishment que si la conversation est entre 2 établissements
        senderEstablishmentId: CurrentPro.establishment != null
            ? CurrentPro.establishment!.id
            : null,
      ); */
    }
    textMessageController.clear();
  }
}
