import 'package:flutter/material.dart';

class Messege {
  static Future<SnackBar> showMessege(context, String text) async {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }
}
