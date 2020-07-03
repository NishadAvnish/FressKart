import 'package:flutter/material.dart';
import 'package:freshkart/Screen/CategoryScreen/categorywise_screen.dart';
import 'package:freshkart/Screen/Wishlist/wishlist.dart';
import 'package:freshkart/Screen/faqscreen.dart';
import 'package:freshkart/Screen/person_screen.dart';
import 'package:freshkart/Screen/screenselector.dart';

import '../Screen/ProductDetail/productdetail.dart';
import '../Widget/fadetransition.dart';

Route<dynamic> genereateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/screenSelector":
      return MaterialPageRoute(builder: (context) => ScreenSelector());
      break;
    case "FAQ":
      return fadeTransition(child: FAQ());
      break;
    case "about":
      return fadeTransition(child: PersonScreen());
      break;
    case "productDetailScreen":
      Map<String, dynamic> _arguments = settings.arguments as Map;
      final _productId = _arguments["productId"];
      final _selectedProdQuantityIndex =
          _arguments["selectedProdQuantityIndex"];
      return fadeTransition(
          child: ProductDetail(
              productId: _productId,
              selectedProdQuantityIndex: _selectedProdQuantityIndex));
      break;
    case "categoryScreen":
      final _index = settings.arguments;
      return fadeTransition(child: CategoryWiseDetail(index: _index));
      break;
    case "cartScreen":
      return fadeTransition(child: WishList());
      break;
  }
}
