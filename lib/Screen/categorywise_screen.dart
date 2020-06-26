import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/appdrawer.dart';
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
  HomeMainCategoryProvider _homeMainCategoryProvider;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _selectedFilterIndex = -1; // that means not any filter item  is selected

    _fetchItems();
  }

  void _fetchItems() {
    if (this.mounted) {
      Provider.of<HomeMainCategoryProvider>(context, listen: false).fetchItem();
      _isLoading = false;
    }
  }

  @override
  void dispose() {
    _homeMainCategoryProvider.disposeVariables();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homeMainCategoryProvider = Provider.of<HomeMainCategoryProvider>(context);
    final _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            flexibleSpace: Container(
                decoration: BoxDecoration(gradient: mainColorGradient)),
            title: Text(
              "Categories",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop()),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.filter_list,
                    ),
                    onPressed: () {
                      setState(() {
                        _filterClicked = !_filterClicked;
                      });
                    }),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: _filter(_mediaQuery),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
            sliver: SliverToBoxAdapter(
                child: _homeMainCategoryProvider
                            .mainCategoryList[widget.index].subCategory ==
                        null
                    ? Container()
                    : SubCategoryWidget(_homeMainCategoryProvider
                        .mainCategoryList[widget.index])),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 0, bottom: 10),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, int index) {
                    return FeatureItem(
                      productItem: _homeMainCategoryProvider.productList[index],
                    );
                  },
                  childCount: _homeMainCategoryProvider.productList.length,
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 190,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 2.7)),
          ),
        ],
      ),
    );
  }

  Widget _filter(MediaQueryData mediaQuery) {
    return AnimatedOpacity(
      opacity: _filterClicked ? 1.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: !_filterClicked
          ? Container()
          : Container(
              decoration: BoxDecoration(gradient: mainColorGradient),
              height: 130,
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
          setState(() {
            _selectedFilterIndex = -1;
          });
        } else {
          setState(() {
            _selectedFilterIndex = index;
          });
        }

        Provider.of<HomeMainCategoryProvider>(context, listen: false)
            .sortingFilter(_selectedFilterIndex);
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
