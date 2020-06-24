import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Screen/home.dart';
import 'package:freshkart/Screen/wishlist.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/appDraw.dart';

import 'categorywise_screen.dart';

class ScreenSelector extends StatefulWidget {
  @override
  _ScreenSelectorState createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector>
    with SingleTickerProviderStateMixin {
  int _selectedBottomNavIndex;
  List<Widget> _screenList = [];
  double _previousValue = 0.0;

  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    _selectedBottomNavIndex = 0;
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _screenList = [
      Home(),
      CategoryWiseDetail(index: 0),
      WishList(),
      CategoryWiseDetail(index: 0)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: CustomScrollView(slivers: [
              SliverFillRemaining(child: _screenList[_selectedBottomNavIndex]),
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
                    position:
                        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                            .animate(animationController),
                    child: _customBottomNavigation(context),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _customBottomNavigation(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: 55,
        width: _size.width,
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: secondaryColor)),
        padding: EdgeInsets.only(left: 22, right: 22, top: 5, bottom: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          bottomNavigationItem(Icons.home, "Home", 0),
          bottomNavigationItem(Icons.search, "Search", 1),
          bottomNavigationItem(Icons.add_shopping_cart, "Cart", 2),
          bottomNavigationItem(Icons.assignment, "Order", 3),
        ]),
      ),
    );
  }

  bottomNavigationItem(IconData icon, String title, int index) {
    return GestureDetector(
      onTap: () => setState(() {
        _selectedBottomNavIndex = index;
      }),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color:
                    _selectedBottomNavIndex == index ? mainColor : Colors.black,
              ),
              Text(
                title,
                style: TextStyle(
                  color: _selectedBottomNavIndex == index
                      ? mainColor
                      : Colors.black,
                ),
              ),
            ]),
      ),
    );
  }
}
