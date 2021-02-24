import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog({
  @required BuildContext context,
  @required String title,
  @required String content,
  @required String defaultActionText,
}) async {
  // if (Platform.isAndroid) {
  return await showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          child: Text(defaultActionText),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
  // }
}
