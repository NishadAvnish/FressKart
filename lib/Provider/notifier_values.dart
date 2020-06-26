import 'package:flutter/cupertino.dart';

final offset = ValueNotifier(0.0);

final productUnit = ValueNotifier(1);
final productQuantity =
    ValueNotifier(""); //used to show the quantity of product selected as in

final selectedBottomNavIndex =
    ValueNotifier(0); // used in ScreenSelector to check the selected index

final selectedDrawerCatergyIndex = ValueNotifier(
    -1); // used in appDrawer to avoid the selection of the same widget again
