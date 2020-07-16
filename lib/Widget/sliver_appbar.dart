import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';

class MySliverAppBar extends StatelessWidget {
  final String title;

  const MySliverAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Text(
        title,
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
      flexibleSpace:
          Container(decoration: BoxDecoration(gradient: mainColorGradient)),
      actions: <Widget>[
        IconButton(
          onPressed: () => Navigator.of(context).pushNamed("about"),
          icon: Icon(Icons.person),
        )
      ],
    );
  }
}
