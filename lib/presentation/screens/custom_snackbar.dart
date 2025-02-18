import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar(
      {Key? key,
      required String message,
      Duration duration = const Duration(seconds: 2),
      VoidCallback? onOK,
      String btnLabel = 'OK'})
      : super(
            key: key,
            content: Text(message),
            duration: duration,
            action: SnackBarAction(
                label: btnLabel,
                onPressed: () {
                  if (onOK != null) onOK();
                }));
}
