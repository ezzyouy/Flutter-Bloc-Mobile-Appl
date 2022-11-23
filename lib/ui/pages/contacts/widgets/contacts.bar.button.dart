import 'package:contacts_bloc_app/bloc/contacts/contacts.actions.dart';
import 'package:contacts_bloc_app/bloc/contacts/contacts.bloc.dart';
import 'package:contacts_bloc_app/ui/pages/contacts/widgets/contacts.button.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsBarButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         ContactsButtonItems(buttonLabel: 'All Contacts',contactsEvent: new LoadAllContactsEvent()),
          ContactsButtonItems(buttonLabel: 'Students',contactsEvent: new LoadStudentsEvent()),
          ContactsButtonItems(buttonLabel: 'Developers',contactsEvent: new LoadDevelopersEvent()),
        ],
      ),
    );
  }
}
