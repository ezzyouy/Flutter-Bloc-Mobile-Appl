import 'package:bloc/bloc.dart';
import 'package:contacts_bloc_app/bloc/contacts/contacts.actions.dart';
import 'package:contacts_bloc_app/bloc/contacts/contacts.state.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/repositories/contacts.repo.dart';



class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactRepository? contactRepository;
  MessagesBloc? messagesBloc;

  ContactsBloc({required ContactsState initialState, this.contactRepository,this.messagesBloc})
      : super(initialState) {
    on<LoadAllContactsEvent>((event, emit) async {
       emit (ContactsState(
          contacts: state.contacts, requestState: RequestState.LOADING,currentEvent: event));
      try {
        List<Contact> data = await contactRepository!.allContacts();
         emit(ContactsState(
            contacts: data, requestState: RequestState.LOADED, currentEvent: event, currentContact: data[0]));
         messagesBloc?.add(new MessagesByContactEvent(data[0]));
      } on Exception catch (e) {
        emit(ContactsState(
            contacts: state.contacts, requestState: RequestState.ERROR,errorMessage: e.toString(),currentEvent: event));
      }
    });
    on<LoadStudentsEvent>((event, emit) async {
      emit (ContactsState(
          contacts: state.contacts, requestState: RequestState.LOADING,currentEvent: event));
      try {
        List<Contact> data = await contactRepository!.contactsByType("Student");
        emit(ContactsState(
            contacts: data, requestState: RequestState.LOADED, currentEvent: event));
      } on Exception catch (e) {
        emit(ContactsState(
            contacts: state.contacts, requestState: RequestState.ERROR,errorMessage: e.toString(),currentEvent: event));
      }
    });
    on<LoadDevelopersEvent>((event, emit) async {
      emit (ContactsState(
          contacts: state.contacts, requestState: RequestState.LOADING,currentEvent: event));
      try {
        List<Contact> data = await contactRepository!.contactsByType("Developer");
        emit(ContactsState(
            contacts: data, requestState: RequestState.LOADED, currentEvent: event));
      } on Exception catch (e) {
        emit(ContactsState(
            contacts: state.contacts, requestState: RequestState.ERROR,errorMessage: e.toString(),currentEvent: event));
      }
    });
  }
}
