import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';

class MustLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You must Sign-in to Access this Section",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("login"),
            child: Text(
              "Click here to Login",
              style: TextStyle(fontWeight: FontWeight.bold, color: mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
