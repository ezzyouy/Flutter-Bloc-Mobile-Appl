import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/model/messag.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageFormWidget extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  Contact? contact;

  MessageFormWidget(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
                  controller: textEditingController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: 'Your message',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                  ),
                )
            ),
            IconButton(onPressed: () {
              Message message = Message(type: 'sent',
                  contactId: contact?.id,
                  content: textEditingController.text);
              context.read<MessagesBloc>().add(new AddMessageEvent(message));
              Message messageReply = Message(type: 'received',
                  contactId: contact?.id,
                  content: 'Ansawer to '+textEditingController.text);
              context.read<MessagesBloc>().add(new AddMessageEvent(messageReply));
            }, icon: Icon(Icons.send))
          ],
        )
    );
  }
}
