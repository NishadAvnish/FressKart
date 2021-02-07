import 'package:flutter/material.dart';

errorDialog(String msg, BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.only(left: 8.0, right: 5.0, top: 15.0),
          title: Center(
              child: Text(
            "Error",
            style: TextStyle(color: Colors.red),
          )),
          content: Text(
            "Please check your Internet Connection and try again.",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          contentPadding: const EdgeInsets.all(12.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          actions: <Widget>[
            Center(child: FlatButton(onPressed: () {}, child: Text("Retry")))
          ],
        );
      });
}
