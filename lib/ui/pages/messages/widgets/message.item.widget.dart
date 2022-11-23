import 'package:contacts_bloc_app/model/messag.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessageItemWidget extends StatelessWidget {
  Message? messages;

  MessageItemWidget(this.messages);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: (messages?.type == 'received')
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          (messages?.type == 'received')
              ? SizedBox(
                  width: 0,
                )
              : SizedBox(
                  width: 40,
                ),
          Flexible(
            child: Container(
              color: (messages?.type == 'received')
                  ? Color.fromARGB(20, 255, 255, 255)
                  : Color.fromARGB(20, 0, 255, 0),
              padding: EdgeInsets.all(20),
              foregroundDecoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: Text(
                  '${messages?.content} (${messages?.date?.day}/${messages?.date?.month}/${messages?.date?.year}:${messages?.date?.hour}:${messages?.date?.minute})'),
            ),
          ),
          (messages?.type == 'sent')
              ? SizedBox(
                  width: 40,
                )
              : SizedBox(
                  width: 0,
                )
        ],
      ),
    );
  }
}
