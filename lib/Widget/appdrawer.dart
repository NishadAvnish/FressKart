import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/person_model.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  HomeMainCategoryProvider _homeMainCategoryProvider;
  PersonModel _personDetail;
  List _menu = [
    "Home",
    "Search",
    "Offer",
    "Cart",
    "Your Order",
    "Shop by Category",
    "FAQ",
    "Logout"
  ];
  List icon = [
    Icons.home,
    Icons.search,
    Icons.local_offer,
    Icons.add_shopping_cart,
    Icons.assignment,
    Icons.category,
    Icons.question_answer,
    Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    _homeMainCategoryProvider = Provider.of<HomeMainCategoryProvider>(context);
    _personDetail = Provider.of<PersonProvider>(context).personDetail;

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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      _personDetail == null
                          ? Navigator.of(context).pushNamed("login")
                          : Navigator.of(context).pushNamed("about");
                    },
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(gradient: mainColorGradient),
                        child: _drawHeader(context)),
                  ),
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
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
          padding: const EdgeInsets.only(
              left: 30, top: 8.0, right: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    _personDetail == null ? "User" : "Avnish",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: null)
            ],
          )),
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
          if (menu[index] == "Logout") {
            Provider.of<PersonProvider>(context, listen: false).logout();
          } else if (menu[index] != "FAQ") {
            Navigator.of(context).pop();
            selectedBottomNavIndex.value = index;
          } else {
            Navigator.of(context).pop();
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
