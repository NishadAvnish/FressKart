import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace:
              Container(decoration: BoxDecoration(gradient: mainColorGradient)),
          title: Text(
            "FAQ",
            style: TextStyle(fontStyle: FontStyle.italic),
          )),
    );
  }
}
