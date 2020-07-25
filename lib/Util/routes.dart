import 'package:flutter/material.dart';
import 'package:freshkart/Screen/CategoryScreen/categorywise_screen.dart';
import 'package:freshkart/Screen/Login_and_Registration/login_screen.dart';
import 'package:freshkart/Screen/Login_and_Registration/registration.dart';
import 'package:freshkart/Screen/Wishlist/wishlist.dart';
import 'package:freshkart/Screen/CheckoutScreen/checkout_page.dart';
import 'package:freshkart/Screen/faqscreen.dart';
import 'package:freshkart/Screen/person_screen.dart';
import 'package:freshkart/Screen/screenselector.dart';
import 'package:freshkart/Screen/splashscreen.dart';
import '../Screen/OrderScreen/order_detail.dart';
import '../Screen/ProductDetail/productdetail.dart';
import '../Widget/fadetransition.dart';

Route<dynamic> genereateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "screenSelector":
      return MaterialPageRoute(builder: (context) => ScreenSelector());
      break;
    case "login":
      return fadeTransition(child: LoginScreen());

      break;
    case "splashscreen":
      return MaterialPageRoute(builder: (context) => SplashScreen());
      break;
    case "registration":
      return MaterialPageRoute(builder: (context) => RegistrationScreen());
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
    case "checkoutScreen":
      return fadeTransition(child: CheckoutPage());
      break;
    case "orderDetail":
      final _index = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => OrderDetailScreen(index: _index));
      break;
  }
}
