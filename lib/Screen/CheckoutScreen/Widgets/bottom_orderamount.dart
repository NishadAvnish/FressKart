import 'package:flutter/material.dart';
import 'package:freshkart/Provider/cart_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';

class BottomOrderAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide()),
      ),
      child: Consumer<CartProvider>(builder: (context, wishlistProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Sub Total ₹ ${wishlistProvider.totalPrice}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.black)),
            MaterialButton(
              onPressed: () {},
              color: secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text("Confirm Order",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.white)),
            ),
          ],
        );
      }),
    );
  }
}
