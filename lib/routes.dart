import 'package:flutter/material.dart';
import 'package:freshkart/Screen/categorywise_screen.dart';
import 'package:freshkart/Screen/faqscreen.dart';
import 'package:freshkart/Screen/screenselector.dart';

import 'Screen/productdetail.dart';
import 'fadetransition.dart';

Route<dynamic> genereateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/screenSelector":
      return MaterialPageRoute(builder: (context) => ScreenSelector());
      break;
    case "FAQ":
      return fadeTransition(child: FAQ());
      break;
    case "detailScreen":
      return fadeTransition(
          child: ProductDetail(productId: settings.arguments));
      break;
    case "categoryScreen":
      final _index = settings.arguments;
      return fadeTransition(child: CategoryWiseDetail(index: _index));
      break;
  }
}
