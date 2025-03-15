import 'package:flutter/material.dart';

import '../project_setup.dart';

class CustomAlertDialog extends StatelessWidget {
  final String message;
  final VoidCallback? callback;

  const CustomAlertDialog({
    super.key,
    required this.message,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(
          text: "Alert", textColor: Colors.black, fontSize: 16, fontWeight: FontWeight.w600
      ),
      content: CustomTextWidget(text: message, textColor: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (callback != null) {
              callback!();
            }
          },
          child: CustomTextWidget(
            text: 'OK',
            textColor: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  static void show(BuildContext context, String message, {VoidCallback? callback}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          message: message,
          callback: callback,
        );
      },
    );
  }

}