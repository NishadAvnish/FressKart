import 'package:flutter/material.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/featureitem.dart';
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

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _selectedFilterIndex = -1;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_selectedFilterIndex == 0)
      Provider.of<HomeProductProvider>(context, listen: false).filter();
  }

  @override
  Widget build(BuildContext context) {
    final _homeProvider = Provider.of<HomeProductProvider>(context);
    final _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: CustomScrollView(
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
                      setState(() {
                        _filterClicked = !_filterClicked;
                      });
                    }),
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            color: mainColor,
            height: _filterClicked ? 130 : 0,
            width: _mediaQuery.size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Sort By",style: TextStyle(color:Colors.white,fontSize:15,decoration: TextDecoration.underline),softWrap: true,),
                  Wrap(
                      spacing: 25,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        _choiceChip("Price (Low to High)", 0),
                        _choiceChip("Price (High to Low)", 1),
                        _choiceChip("Popularity", 2),
                        _choiceChip("Discount", 3),
                      ]),
                ],
              ),
            ),
          )),
          SliverPadding(
            padding: EdgeInsets.all(12.0),
            sliver: SliverToBoxAdapter(
                child: _homeProvider
                            .mainCategoryList[widget.index].subCategory ==
                        null
                    ? Container()
                    : SubCategoryList(
                        context, _homeProvider.mainCategoryList[widget.index])),
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
    );
  }

  Widget _choiceChip(String title, int index) {
    return GestureDetector(
      onTap: () => setState(() {
        if (_selectedFilterIndex == index) {
          _selectedFilterIndex = -1;
        } else
          _selectedFilterIndex = index;
      }),
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
