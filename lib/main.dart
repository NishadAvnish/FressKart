import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Provider/order_provider.dart';
import 'package:freshkart/Provider/cart_provider.dart';
import 'package:freshkart/model/order_model_and_provider.dart';
import 'package:provider/provider.dart';
import 'Provider/homeproduct_provider.dart';
import 'Provider/search_provider.dart';
import 'Provider/person_detail_provider.dart';
import 'package:freshkart/Provider/offer_provider.dart';
import 'Util/routes.dart';

void main() => runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode, // Ensures that it is disabled in release mode

    //   builder: (context) => MyApp(),
    // ),
    MyApp());

class MyApp extends StatelessWidget {
//   This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProductProvider(),
        ),
        ChangeNotifierProvider.value(
          value: HomeMainCategoryProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SearchProvider(),
        ),
        ChangeNotifierProvider.value(
          value: PersonProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OfferProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OrderProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OrderModelProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'FreshKart',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.green, splashColor: Colors.green),
        // initialRoute: "screenSelector",
        initialRoute: "splashscreen",
        onGenerateRoute: genereateRoute,
      ),
    );
  }
}
