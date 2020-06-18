import 'package:flutter/material.dart';
import 'package:freshkart/Screen/categorywise_screen.dart';
import 'package:freshkart/Screen/screenselector.dart';

import 'Screen/productdetail.dart';
import 'fadetransition.dart';

Route<dynamic> genereateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/screenSelector":
      return MaterialPageRoute(builder: (context) => ScreenSelector());
      break;
    case "detailScreen":
      return fadeTransition(
          child: ProductDetail(productId: settings.arguments));
      break;
    case "categoryScreen":
      return fadeTransition(child: CategoryWiseDetail());
      break;
  }
}
