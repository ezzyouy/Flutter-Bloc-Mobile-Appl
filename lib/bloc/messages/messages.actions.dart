import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/model/messag.model.dart';

abstract class MessagesEvent<T>{
  T? payload;

  MessagesEvent({this.payload});
}

class MessagesByContactEvent extends MessagesEvent<Contact>{
  MessagesByContactEvent(Contact payload) :super(payload:payload);
}
class AddMessageEvent extends MessagesEvent<Message>{

  AddMessageEvent(Message payload):super(payload: payload);
}
class DeleteMessagesEvent extends MessagesEvent<Message>{

  DeleteMessagesEvent():super();
}
class SelectMessageEvent extends MessagesEvent<Message>{
  SelectMessageEvent(Message payload):super(payload: payload);
}