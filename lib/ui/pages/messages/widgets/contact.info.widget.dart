import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactInfoWidget extends StatelessWidget {
  Contact? contact;
ContactInfoWidget({this.contact});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(child: Text('${contact?.profil}'),),
          SizedBox(width: 10,),
          Text('${contact?.name}')
        ],
      ),
    );
  }
}
