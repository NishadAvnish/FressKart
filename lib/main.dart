import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Provider/wishlist_provider.dart';
import 'package:freshkart/routes.dart';
import 'package:provider/provider.dart';
import 'Provider/homeproduct_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: "/screenSelector",
        onGenerateRoute: genereateRoute,
      ),
    );
  }
}
