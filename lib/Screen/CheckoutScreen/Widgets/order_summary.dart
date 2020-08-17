import 'package:flutter/material.dart';
import 'package:freshkart/Provider/cart_provider.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartProvider = Provider.of<CartProvider>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: <Widget>[
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      _cartProvider.cartList[index].title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "Qty: ${_cartProvider.cartList[index].quantity}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black54),
                    ),
                    Text(
                      "₹ ${_cartProvider.cartList[index].actualPrice} x ${_cartProvider.cartList[index].unit}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Divider()
            ],
          );
        },
        childCount: _cartProvider.cartList.length,
      ),
    );
  }
}
