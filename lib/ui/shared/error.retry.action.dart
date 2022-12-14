import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ErrorRetryMessage extends StatelessWidget {
String? errorMessage;
 VoidCallback onAction;
ErrorRetryMessage({this.errorMessage, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${errorMessage}"),
        RaisedButton(
          onPressed: onAction,
          child: Text(
            'Retry',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.deepOrange,
        )
      ],
    );
  }
}
