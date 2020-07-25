import 'package:flutter/material.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';

class MySliverAppBar extends StatelessWidget {
  final String title;

  const MySliverAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    final _personDetail = Provider.of<PersonProvider>(context).personDetail;

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
          onPressed: () {
            _personDetail == null
                ? Navigator.of(context).pushNamed("login")
                : Navigator.of(context).pushNamed("about");
          },
          icon: Icon(Icons.person),
        )
      ],
    );
  }
}
