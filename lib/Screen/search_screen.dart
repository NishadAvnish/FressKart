import 'package:flutter/material.dart';
import 'package:freshkart/Provider/search_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/horizontalItem.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textEditingController;
  FocusNode _focusNode;
  bool _isSubmitClicked;
  bool _isLoading;
  SearchProvider _searchProvider;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    _isSubmitClicked = false;
    _isLoading = false;
  }

  Future<void> _submitOperation() async {
    _focusNode.unfocus();
    setState(() {
      _isLoading = true;
    });
    await Provider.of<SearchProvider>(context, listen: false)
        .searchItem(_textEditingController.text);
    if (_textEditingController.text.length != 0) {
      setState(() {
        _isSubmitClicked = true;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return CustomScrollView(
      slivers: <Widget>[
        _sliverAppBar(),
        if (!_isSubmitClicked)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Suggestion",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        _searchBody()
      ],
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      floating: true,
      title: Text(
        "Search",
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
      expandedHeight: 100,
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
                flex: 6,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 4.0),
                        filled: true,
                        hintText: "Search for Product",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      onChanged: (currentText) {
                        if (_isSubmitClicked) {
                          setState(() {
                            _isSubmitClicked = false;
                          });
                        }

                        if (_textEditingController.text.length == 0 &&
                            _searchProvider.searchedList.length != 0) {
                          setState(() {
                            _isSubmitClicked = true;
                          });
                        }
                      },
                      onSubmitted: (finalText) async {
                        if (finalText != "") _submitOperation();
                      }),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    if (_textEditingController.text != "") _submitOperation();
                  },
                  child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white),
                      child: Icon(Icons.search)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBody() {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, _) {
        return _isLoading
            ? SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()))
            : _isSubmitClicked
                ? SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return HorizontalItem(
                          productItem: searchProvider.searchedList[index],
                        );
                      }, childCount: searchProvider.searchedList.length),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ListTile(
                        title: Text(
                          searchProvider.popularSearch[index],
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.call_made,
                              size: 18,
                            ),
                            onPressed: () {
                              _textEditingController.text =
                                  searchProvider.popularSearch[index];
                              _focusNode.requestFocus();
                            }),
                      );
                    }, childCount: searchProvider.popularSearch.length),
                  );
      },
    );
  }
}
