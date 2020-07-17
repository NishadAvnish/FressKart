import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Provider/wishlist_provider.dart';
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
          value: WishListProvider(),
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.green, splashColor: Colors.green),
        // initialRoute: "screenSelector",
        initialRoute: "checkOutScreen",
        onGenerateRoute: genereateRoute,
      ),
    );
  }
}
