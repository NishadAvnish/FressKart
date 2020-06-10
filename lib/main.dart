import 'package:flutter/material.dart';
import 'package:freshkart/Screen/screenselector.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ScreenSelector(),
      ),
    );
  }
}