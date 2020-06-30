import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Screen/person_screen.dart';
import 'package:freshkart/Screen/Wishlist/wishlist.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/appdrawer.dart';
import 'CategoryScreen/categorywise_screen.dart';
import 'offer_screen.dart';
import '../Screen/HomeScreen/home.dart';

class ScreenSelector extends StatefulWidget {
  @override
  _ScreenSelectorState createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector>
    with SingleTickerProviderStateMixin {
  List<Widget> _screenList = [];
  double _previousValue = 0.0;

  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _screenList = [
      Home(),
      OfferZone(),
      WishList(),
      CategoryWiseDetail(index: 0),
      PersonScreen()
    ];
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        drawer: AppDrawer(),
        resizeToAvoidBottomInset: false,
        body: ValueListenableBuilder(
            valueListenable: selectedBottomNavIndex,
            builder: (context, selectedBottomNavIndexValue, _) {
              return Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: CustomScrollView(slivers: [
                      SliverFillRemaining(
                          child: _screenList[selectedBottomNavIndexValue]),
                    ]),
                  ),
                  Positioned(
                    bottom: 0,
                    child: ValueListenableBuilder(
                        valueListenable: offset,
                        builder: (context, value, _) {
                          final _isMovable = _previousValue;
                          _previousValue = value;
                          value > _isMovable
                              ? animationController.reverse()
                              : animationController.forward();
                          return SlideTransition(
                            position: Tween<Offset>(
                                    begin: Offset(0, 1), end: Offset(0, 0))
                                .animate(animationController),
                            child: _customBottomNavigation(
                                context, selectedBottomNavIndexValue),
                          );
                        }),
                  )
                ],
              );
            }),
      ),
    );
  }

  Widget _customBottomNavigation(
      BuildContext context, int selectedBottomNavIndexValue) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: _size.width,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          bottomNavigationItem(
              Icons.home, "Home", 0, selectedBottomNavIndexValue),
          bottomNavigationItem(
              Icons.local_offer, "Offer", 1, selectedBottomNavIndexValue),
          // bottomNavigationItem(
          //     Icons.search, "Search", 1, selectedBottomNavIndexValue),
          bottomNavigationItem(
              Icons.add_shopping_cart, "Cart", 2, selectedBottomNavIndexValue),
          bottomNavigationItem(
              Icons.assignment, "Order", 3, selectedBottomNavIndexValue),
          bottomNavigationItem(
              Icons.person, "About", 4, selectedBottomNavIndexValue),
        ]),
      ),
    );
  }

  bottomNavigationItem(
      IconData icon, String title, int index, int selectedIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBottomNavIndex.value = index;
        });
      },
      child: Container(
        width: 60,
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: selectedIndex == index ? mainColor : Colors.black,
              ),
              Text(
                title,
                style: TextStyle(
                  color: selectedIndex == index ? mainColor : Colors.black,
                ),
              ),
            ]),
      ),
    );
  }
}
