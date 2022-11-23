import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactHorizontalItemWidget extends StatelessWidget {
  Contact? contacts;
  int? index;
  ScrollController? scrollController;
  ContactHorizontalItemWidget({this.contacts, this.index, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.read<MessagesBloc>().add(new MessagesByContactEvent(contacts as Contact));
          scrollController?.animateTo((index!*200-150).toDouble(), duration: Duration(microseconds: 2000), curve: Curves.ease);
        },
        child: BlocBuilder<MessagesBloc, MessageState>(
          builder: (context, messagesState) => Card(
            child: Container(
              padding: EdgeInsets.all(16),
              width: 150,
              child: Column(
                children: [
                  CircleAvatar(
                    child: Text('${contacts?.profil}'),
                  ),
                  Text('${contacts?.name}'),
                  Text('${contacts?.score}'),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: (messagesState.currentContact ==
                          contacts)
                          ? 3
                          : 1,
                      color: Colors.deepOrange)),
            ),
          ),
        ),
      ),
    );
  }
}
