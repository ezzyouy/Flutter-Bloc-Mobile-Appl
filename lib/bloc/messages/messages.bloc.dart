import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/messag.model.dart';
import 'package:contacts_bloc_app/repositories/messages.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessageState>{
  MessagesRepositories? messagesRepositories;
  MessagesBloc({required MessageState initialState, this.messagesRepositories}):super(initialState){
    on<MessagesByContactEvent>((event, emit) async{
      emit(MessageState(requestState: RequestState.LOADING, messages:state.messages,currentEvent:event, selectMessage: state.selectMessage, currentContact: event.payload ));
      try {
        List<Message> data=await messagesRepositories!.messageByContact(event.payload?.id as int);
        emit(MessageState(messages: data, requestState: RequestState.LOADED, currentEvent: event, selectMessage: state.selectMessage, currentContact: event.payload));
      } on Exception catch (e) {
       emit(MessageState( requestState: RequestState.ERROR, currentEvent:event, messageError: e.toString(), messages: state.messages, selectMessage: state.selectMessage,currentContact: event.payload));

      }
    });
        on<AddMessageEvent>((event, emit) async{
     // emit(MessageState(requestState: RequestState.LOADING, messages:state.messages,currentEvent:event ));
      try {
        event.payload?.date=DateTime.now();
        Message message=await messagesRepositories!.addNewMessage(event.payload as Message);
        List<Message> data=[...?state.messages];
        data.add(message);
        emit(MessageState(messages: data, requestState: RequestState.LOADED, currentEvent: event, selectMessage: state.selectMessage, currentContact: state.currentContact));
      } on Exception catch (e) {
        emit(MessageState( requestState: RequestState.ERROR, currentEvent:event, messageError: e.toString(), messages: state.messages , selectMessage: state.selectMessage));

      }
    });
        on<SelectMessageEvent>((event, emit) {
          List<Message> messages=state.messages as List<Message>;
          List<Message> selected=[...?state.selectMessage];
          for(Message m in messages){
            if(m.id==event.payload.id){
              m.selected=!m.selected);
            }
            if(m.selected==true){
              selected.add(m);
          }
            else{
              selected.removeWhere((element) => element.id==m.id);
          }
          }
          MessageState messageState=MessageState(messages:messages, selectMessage:selected, currentEvent:event, requestState:RequestState.LOADED);
          emit(messageState);

        },);
    on<DeleteMessagesEvent>((event, emit) async{
      List<Message> messages=state.messages as List<Message>;
      List<Message> selected=[...?state.selectMessage];
      for(Message m in selected){
        try{
          await messagesRepositories?.deleteMessage(m);
          MessageState messageSatet=MessageState(messages: messages, selectMessage: selected ,currentEvent: event, requestState: RequestState.LOADED, currentContact: state.currentContact);
          emit(messageSatet);
        }
        catch(e){
          MessageState messageState= MessageState(messages: messages,selectMessage:selected,currentEvent: event, requestState: RequestState.ERROR, currentContact: state.currentContact );
          emit(messageState);
        }
      }
  });


}}