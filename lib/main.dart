import 'package:contacts_bloc_app/bloc/contacts/contacts.actions.dart';
import 'package:contacts_bloc_app/bloc/contacts/contacts.bloc.dart';
import 'package:contacts_bloc_app/bloc/contacts/contacts.state.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/repositories/contacts.repo.dart';
import 'package:contacts_bloc_app/repositories/messages.repository.dart';
import 'package:contacts_bloc_app/ui/pages/contacts/contact.page.dart';
import 'package:contacts_bloc_app/ui/pages/contactsWith%20Messages/contcats.messages.page.dart';
import 'package:contacts_bloc_app/ui/pages/messages/messages.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactRepository());
  GetIt.instance.registerLazySingleton(() => new MessagesRepositories());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>MessagesBloc(
            initialState: MessageState(
              requestState: RequestState.NONE,
              messages: [],
              messageError: '',
              currentEvent:null,
              selectMessage: [],
              currentContact:new Contact()
            ),
            messagesRepositories:GetIt.instance<MessagesRepositories>()
    )),
        BlocProvider(
          create: (context) => ContactsBloc(
              initialState: ContactsState(
                  contacts: [],
                  errorMessage: '',
                  requestState: RequestState.NONE,
                  currentEvent: LoadAllContactsEvent()),
              contactRepository: GetIt.instance<ContactRepository>(),
          messagesBloc: context.read<MessagesBloc>()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        routes: {
          '/contacts': (context) => ContactsPage(),
          '/messages': (context) => MessagesPage(),
          '/contactsWithMessages': (context) => ContactsWithMessages()
        },
        initialRoute: "/contactsWithMessages",
      ),
    );
  }
}
