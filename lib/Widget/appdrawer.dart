import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  HomeMainCategoryProvider _homeMainCategoryProvider;
  List _menu = [
    "Home",
    "Search",
    "Cart",
    "Your Order",
    "Shop by Category",
    "FAQ"
  ];
  List icon = [
    Icons.home,
    Icons.search,
    Icons.add_shopping_cart,
    Icons.assignment,
    Icons.category,
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
                      decoration: BoxDecoration(gradient:mainColorGradient),
                      child: _drawHeader(context)),
                ),
                // SliverToBoxAdapter(child: _drawItem(_menu)),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return _drawItem(_menu, context, index);
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

  Widget _drawItem(List menu, BuildContext context, int index) {
    if (menu[index] == "Shop by Category") {
      return Column(
        children: <Widget>[
          Divider(),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: Icon(icon[index]),
              title: Text(menu[index]),
              children: <Widget>[
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _homeMainCategoryProvider.mainCategoryList.length,
                  itemBuilder: (context, index) {
                    return ValueListenableBuilder(
                        valueListenable: selectedDrawerCatergyIndex,
                        builder: (context, previouSelectedIndex, _) {
                          return GestureDetector(
                            // this below code will help in avoiding again clicking on current screen drawer
                            onTap: previouSelectedIndex == index
                                ? () => Navigator.of(context).pop()
                                : () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pushNamed(
                                        "categoryScreen",
                                        arguments: index);

                                    selectedDrawerCatergyIndex.value = index;
                                  },
                            child: ListTile(
                              leading: CircleAvatar(
                                  child: Image.asset(_homeMainCategoryProvider
                                      .mainCategoryList[index].imageUrl)),
                              title: Text(_homeMainCategoryProvider
                                  .mainCategoryList[index].title),
                            ),
                          );
                        });
                  },
                )
              ],
            ),
          ),
          Divider()
        ],
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          if (menu[index] != "FAQ") {
            selectedBottomNavIndex.value = index;
          } else {
            Navigator.of(context).pushNamed("FAQ");
            selectedDrawerCatergyIndex.value = index;
          }
        },
        child: ListTile(
          leading: Icon(icon[index]),
          title: Text(menu[index]),
        ),
      );
    }
  }
}
