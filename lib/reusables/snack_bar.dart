import 'package:flutter/material.dart';

import 'colors.dart';

showSnackBar(BuildContext context, String title, {bool error = false}) {
  final snackBar = SnackBar(
    backgroundColor: error ? red : green,
    duration: Duration(seconds: error ? 3 : 1),
    content: Text(
      title,
      style: const TextStyle(color: white),
    ),
    action: SnackBarAction(
      label: "OK",
      textColor: white,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


