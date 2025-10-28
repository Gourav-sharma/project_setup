import 'package:flutter/material.dart';

/// ------------------
/// 1. Normal Alert Dialog
/// ------------------
class CustomNormalDialog extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final String? message;
  final Widget? content;
  final String okText;
  final VoidCallback? onOk;

  const CustomNormalDialog({
    super.key,
    this.title,
    this.titleWidget,
    this.message,
    this.content,
    this.okText = "OK",
    this.onOk,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: titleWidget ??
          (title != null
              ? Text(title!, style: const TextStyle(fontWeight: FontWeight.bold))
              : null),
      content: content ?? (message != null ? Text(message!) : null),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onOk?.call();
          },
          child: Text(okText),
        ),
      ],
    );
  }

  static void show(
      BuildContext context,
      {
        String? title,
        Widget? titleWidget,
        String? message,
        Widget? content,
        String okText = "OK",
        VoidCallback? onOk,
      }) {
    showDialog(
      context: context,
      builder: (_) => CustomNormalDialog(
        title: title,
        titleWidget: titleWidget,
        message: message,
        content: content,
        okText: okText,
        onOk: onOk,
      ),
    );
  }
}

/// ------------------
/// 2. Confirmation Dialog
/// ------------------
class CustomConfirmationDialog extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final String? message;
  final Widget? content;
  final String positiveText;
  final String negativeText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const CustomConfirmationDialog({
    super.key,
    this.title,
    this.titleWidget,
    this.message,
    this.content,
    this.positiveText = "Yes",
    this.negativeText = "No",
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: titleWidget ??
          (title != null
              ? Text(title!, style: const TextStyle(fontWeight: FontWeight.bold))
              : null),
      content: content ?? (message != null ? Text(message!) : null),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onCancel?.call();
          },
          child: Text(negativeText),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm.call();
          },
          child: Text(positiveText),
        ),
      ],
    );
  }

  static void show(
      BuildContext context, {
        String? title,
        Widget? titleWidget,
        String? message,
        Widget? content,
        String positiveText = "Yes",
        String negativeText = "No",
        required VoidCallback onConfirm,
        VoidCallback? onCancel,
      }) {
    showDialog(
      context: context,
      builder: (_) => CustomConfirmationDialog(
        title: title,
        titleWidget: titleWidget,
        message: message,
        content: content,
        positiveText: positiveText,
        negativeText: negativeText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }
}





