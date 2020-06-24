import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  HomeMainCategoryProvider _homeMainCategoryProvider;
  List _menu = [
    "Home",
    "Search",
    "Shop by Category",
    "Your Order",
    "Cart",
    "FAQ"
  ];
  List icon = [
    Icons.home,
    Icons.search,
    Icons.category,
    Icons.assignment,
    Icons.add_shopping_cart,
    Icons.question_answer
  ];

  @override
  Widget build(BuildContext context) {
    _homeMainCategoryProvider = Provider.of<HomeMainCategoryProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Drawer(
          elevation: 0.0,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                      width: double.infinity,
                      color: mainColor,
                      child: _drawHeader(context)),
                ),
                // SliverToBoxAdapter(child: _drawItem(_menu)),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return _drawItem(_menu, index);
                }, childCount: _menu.length))
              ],
            ),
          )),
    );
  }

  Widget _drawHeader(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        CircleAvatar(
          radius: 40,
          child: FlutterLogo(),
        ),
        SizedBox(height: 15),
        Text(
          "Avnish",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          "9971604962",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget _drawItem(List menu, int index) {
    if (menu[index] == "Shop by Category") {
      return Column(
        children: <Widget>[
          ExpansionTile(
            leading: Icon(icon[index]),
            title: Text(menu[index]),
            children: <Widget>[
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _homeMainCategoryProvider.mainCategoryList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        child: Image.asset(_homeMainCategoryProvider
                            .mainCategoryList[index].imageUrl)),
                    title: Text(_homeMainCategoryProvider
                        .mainCategoryList[index].title),
                  );
                },
              )
            ],
          ),
          Divider()
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          (menu[index] == "FAQ") ? Divider() : Container(),
          ListTile(
            leading: Icon(icon[index]),
            title: Text(menu[index]),
          ),
        ],
      );
    }
  }
}
