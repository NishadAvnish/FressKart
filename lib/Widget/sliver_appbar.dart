import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';

class MySliverAppBar extends StatefulWidget {
  final String title;
  MySliverAppBar({Key key, this.title}) : super(key: key);

  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  IconData _actionIcon;
  Widget _titleWidget;
  bool _isSearchClicked;
  FocusNode _focusNode;
  @override
  void initState() {
    _isSearchClicked = false;
    _focusNode = FocusNode();
    _titleWidget = Text(
      widget.title,
      style: const TextStyle(fontStyle: FontStyle.italic),
    );

    _actionIcon = Icons.search;

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
        floating: true,
        title: _titleWidget,
        flexibleSpace: Container(
          decoration:BoxDecoration(gradient:mainColorGradient)
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (!_isSearchClicked) {
                  _focusNode.requestFocus();
                  _actionIcon = Icons.cancel;
                  _titleWidget = TextField(
                    textInputAction: TextInputAction.go,
                    focusNode: _focusNode,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Search for Product",
                        hintStyle: TextStyle(color: Colors.greenAccent),
                        fillColor: mainColor,
                        border: InputBorder.none),
                  );
                } else {
                  _focusNode.unfocus();
                  _actionIcon = Icons.search;
                  _titleWidget = Text(
                    widget.title,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  );
                }
                _isSearchClicked = !_isSearchClicked;
              });
            },
            icon: Icon(_actionIcon),
          )
        ],
     
    );
  }
}
