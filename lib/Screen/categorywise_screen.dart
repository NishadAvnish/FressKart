import 'package:flutter/material.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/list_items.dart';
import 'package:freshkart/Widget/subcategorylist.dart';
import 'package:provider/provider.dart';

class CategoryWiseDetail extends StatefulWidget {
  final int index;

  const CategoryWiseDetail({Key key, this.index}) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryWiseDetail>
    with SingleTickerProviderStateMixin {
  bool _isLoading;
  bool _filterClicked = false;
  int _selectedFilterIndex;
  HomeProductProvider _homeProvider;
  ScrollController _scrollController;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _selectedFilterIndex = -1;
    //connecting this scoller with customscrollview need some some for widget building process.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController = ScrollController(initialScrollOffset: 0.0);
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // if (_selectedFilterIndex != -1)
    //   Provider.of<HomeProductProvider>(context, listen: false).filter();
  }

  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProductProvider>(context);
    final _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                title: Text(
                  "Categories",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.filter_list,
                        ),
                        onPressed: () {
                          if (_filterClicked) {
                            _controller.reverse();
                          } else {
                            _controller.forward();
                          }

                          setState(() {
                            _filterClicked = !_filterClicked;
                          });
                        }),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Builder(builder: (context) {
                  if (_scrollController != null &&
                      _scrollController.offset == 0.0) {
                    return _filter(_mediaQuery);
                  } else
                    return SizeTransition(
                        sizeFactor: _controller,
                        child: Container(
                          height: 130,
                          color: Colors.transparent,
                        ));
                }),
              ),
              SliverPadding(
                padding: EdgeInsets.all(12.0),
                sliver: SliverToBoxAdapter(
                    child: _homeProvider
                                .mainCategoryList[widget.index].subCategory ==
                            null
                        ? Container()
                        : subCategoryList(context,
                            _homeProvider.mainCategoryList[widget.index])),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 0, bottom: 10),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, int index) {
                        return FeatureItem(
                          productItem: _homeProvider.productList[index],
                        );
                      },
                      childCount: _homeProvider.productList.length,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 190,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 2.7)),
              ),
            ],
          ),
          Positioned(
            top: kToolbarHeight + _mediaQuery.padding.top-5,
            left: 0,
            right: 0,
            child: _filter(_mediaQuery),
          )
        ],
      ),
    );
  }

  Widget _filter(MediaQueryData mediaQuery) {
    return SizeTransition(
      sizeFactor: _controller,
      child: Container(
        color: mainColor,
        height: 140,
        width: mediaQuery.size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sort By",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                softWrap: true,
              ),
              Expanded(
                child: Wrap(
                    spacing: 25,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      _choiceChip("Price (Low to High)", 0),
                      _choiceChip("Price (High to Low)", 1),
                      _choiceChip("Popularity", 2),
                      _choiceChip("Discount", 3),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _choiceChip(String title, int index) {
    return GestureDetector(
      onTap: () {
        if (_selectedFilterIndex == index) {
          _selectedFilterIndex = -1;
        } else {
          _selectedFilterIndex = index;
          _homeProvider.filter(_selectedFilterIndex);
        }
      },
      child: ChoiceChip(
        disabledColor: Colors.white,
        selectedColor: secondaryColor,
        labelStyle: TextStyle(color: Colors.black),
        label: Text(
          title,
        ),
        selected: _selectedFilterIndex == index,
      ),
    );
  }
}
