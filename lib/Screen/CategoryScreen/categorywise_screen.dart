import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/appdrawer.dart';
import 'package:freshkart/Widget/list_items.dart';
import 'package:freshkart/Screen/CategoryScreen/subcategorylist.dart';
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

  Future<void> _fetchItems() async {
    await Provider.of<HomeMainCategoryProvider>(context, listen: false)
        .fetchItem();
    if (this.mounted) {
      setState(() {
        _isLoading = false;
      });
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
                      Icons.sort,
                    ),
                    onPressed: () {
                      setState(() {
                        _filterClicked = !_filterClicked;
                      });

                      _filterClicked
                          ? showBottomSheet()
                          : Navigator.of(context).pop();
                    }),
              ),
            ],
          ),
          _isLoading
              ? SliverFillRemaining(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 10, bottom: 10),
                        child: _homeMainCategoryProvider
                                    .mainCategoryList[widget.index]
                                    .subCategory ==
                                null
                            ? Container()
                            : SubCategoryWidget(_homeMainCategoryProvider
                                .mainCategoryList[widget.index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12.0, top: 0, bottom: 10),
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 190,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 2 / 2.7),
                            itemBuilder: (context, int index) {
                              return FeatureItem(
                                productItem: _homeMainCategoryProvider
                                    .productList[index],
                              );
                            },
                            itemCount:
                                _homeMainCategoryProvider.productList.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  showBottomSheet() {
    Future<void> future = showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text("Sort By",
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              Divider(),
              _listTile("Price (Low to High)", 0),
              _listTile("Price (High to Low)", 1),
              _listTile("Popularity", 2),
              _listTile("Discount", 3),
            ],
          ),
        );
      },
    );
    future.then((void value) => _closeModal());
  }

  void _closeModal() {
    setState(() {
      _filterClicked = !_filterClicked;
    });
  }

  Widget _listTile(String title, int index) {
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
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ));
  }
}
