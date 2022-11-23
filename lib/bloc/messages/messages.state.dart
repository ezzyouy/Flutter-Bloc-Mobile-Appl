import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/model/messag.model.dart';
import 'package:contacts_bloc_app/repositories/messages.repository.dart';

class MessageState {
  RequestState? requestState;
  List<Message>? messages;
  String? messageError;
  MessagesEvent? currentEvent;
  List<Message>? selectMessage = [];
  Contact? currentContact;

  MessageState(
      {this.requestState,
      this.messages,
      this.messageError,
      this.currentEvent,
      this.selectMessage,
      this.currentContact});

/*MessageState.initialState():
        requestState= RequestState.NONE,
        message= [],
        messageError= '',
        currentEvent= null,*/
}
