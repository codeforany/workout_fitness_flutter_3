import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension StateExtension on State {
  void mdShowAlert(String title, String message, VoidCallback onPressed,
      {String buttonTitle = "Ok",
      TextAlign messageTextAlign = TextAlign.center}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(
          message,
          textAlign: messageTextAlign,
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(buttonTitle),
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
          )
        ],
      ),
    );
  }

  void endEditing(){
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

extension ExtendDateTime on DateTime {
  String stringFormat({String  format = "yyyy-MM-dd"}) {
    return DateFormat(format).format(this);
  }
}