import 'package:flutter/material.dart';
import 'package:freshkart/Provider/search_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textEditingController;
  FocusNode _focusNode;
  bool _isSearchedClicked;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    _isSearchedClicked = false;
  }

  @override
  Widget build(BuildContext context) {
    final _searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _sliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                title: Text(
                  _searchProvider.popularSearch[index],
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.call_made,
                      size: 18,
                    ),
                    onPressed: () {
                      _textEditingController.text =
                          _searchProvider.popularSearch[index];
                      _focusNode.requestFocus();
                    }),
              );
            }, childCount: _searchProvider.popularSearch.length),
          )
        ],
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      floating: true,
      title: Text(
        "Search",
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
      expandedHeight: 110,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: mainColorGradient),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight,
              left: 12.0,
              right: 12.0,
              bottom: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 7,
                child: TextField(
                  controller: _textEditingController,
                  focusNode: _focusNode,
                  showCursor: true,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search for Product",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white),
                  child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _isSearchedClicked = true;
                        });
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
