import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  @override
  void initState() {
    super.initState();
    _fetchUserDetail();
  }

  Future<void> _fetchUserDetail() async {
    await Provider.of<PersonProvider>(context, listen: false).fetchDetail();
    final _sharedPreference = await SharedPreferences.getInstance();
    final _canSkipLogin = _sharedPreference.getBool("canSkipLogin") ?? false;

    final _personDetail =
        Provider.of<PersonProvider>(context, listen: false).personDetail;

    if (_personDetail == null && !_canSkipLogin)
      Navigator.of(context).pushReplacementNamed("login");
    else
      _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 4),
        () => Navigator.of(context).pushReplacementNamed("screenSelector"));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/Images/snacks.jpg"),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "FreshKart",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
