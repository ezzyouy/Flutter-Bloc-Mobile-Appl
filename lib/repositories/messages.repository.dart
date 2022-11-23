
import 'dart:math';

import 'package:contacts_bloc_app/model/messag.model.dart';

class MessagesRepositories{
  int messageCount=6;
  Map<int, Message> messages={
    1:Message(id:1, contactId: 1, date: DateTime.now(), content: 'Hello Mohamed kddhd ddbdkjdkjd kjdbkjkdj kdkjdkdj', type: 'sent'),
    2:Message(id:2, contactId: 1, date: DateTime.now(), content: 'Ok Thanks rfdfsd sfdsfsd sddfs sdfdsf sfdsfsd sddfs sdfdsf', type: 'received'),
    3:Message(id:3, contactId: 1, date: DateTime.now(), content: 'What are you doing', type: 'sent'),
    4:Message(id:4, contactId: 1, date: DateTime.now(), content: 'Nothing', type: 'received'),
    5:Message(id:5, contactId: 2, date: DateTime.now(), content: ' Hi Yassine', type: 'sent'),
    6:Message(id:6, contactId: 2, date: DateTime.now(), content: 'Well received', type: 'received'),
  };


  MessagesRepositories(){
    this.messageCount=messages.length;
  }

  Future<List<Message>> allMessages() async{
   var future= Future.delayed(Duration(seconds: 1));
   int rnd=Random().nextInt(10);
   if(rnd>1){
     return messages.values.toList();
   }
   else{
     throw new Exception('Intenet Error');
   }
  }
  Future<List<Message>> messageByContact(int contactId) async{
    var future= Future.delayed(Duration(seconds: 1));
    int rnd=Random().nextInt(10);
    if(rnd>1){
      return messages.values.toList().where((element) => element.contactId==contactId).toList();
    }
    else{
      throw new Exception('Intenet Error');
    }
  }
  Future<Message> addNewMessage(Message message) async{
    var future= Future.delayed(Duration(seconds: 1));
    int rnd=Random().nextInt(10);
    if(rnd>1){
      message.id=++messageCount;
      messages[message.id as int]=message;
      return message;
    }
    else{
      throw new Exception('Intenet Error');
    }
  }
  Future<void> selectedMessage(Message message) async{
    var future= Future.delayed(Duration(seconds: 1));
    int rnd=Random().nextInt(10);
    if(rnd>1){


    }
    else{
      throw new Exception('Intenet Error');
    }
  }
  Future<void> deleteMessage(Message message) async{
    var future= Future.delayed(Duration(seconds: 1));
    int rnd=Random().nextInt(10);
    if(rnd>1){


    }
    else{
      throw new Exception('Intenet Error');
    }
  }
}