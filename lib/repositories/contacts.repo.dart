import 'dart:math';

import 'package:contacts_bloc_app/model/contact.model.dart';

class ContactRepository {
  Map<int, Contact> contacts = {
    1: Contact(
        id: 1, name: 'Mohamed', profil: 'MO', type: 'Student', score: 1234),
    2: Contact(
        id: 2, name: 'Yassin', profil: 'YA', type: 'Student', score: 1234),
    3: Contact(
        id: 3, name: 'Hassnae', profil: 'HA', type: 'Developer', score: 345),
    4: Contact(id: 1, name: 'Ayman', profil: 'AY', type: 'Student', score: 257),
    5: Contact(id: 1, name: 'Sara', profil: 'SA', type: 'Developer', score: 874)
  };

  Future<List<Contact>> allContacts() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 3) {
      return contacts.values.toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  Future<List<Contact>> contactsByType(String type) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if (rnd > 1) {
      return contacts.values.toList().where((element) => element.type == type).toList();
    } else {
      throw new Exception("Internet Error");
    }
  }
}
