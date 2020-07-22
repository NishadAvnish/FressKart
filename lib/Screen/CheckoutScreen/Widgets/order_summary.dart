import 'package:flutter/material.dart';
import 'package:freshkart/Provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);

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
                      wishListProvider.wishList[index].title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "Qty: ${wishListProvider.wishList[index].quantity}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black54),
                    ),
                    Text(
                      "₹ ${wishListProvider.wishList[index].actualPrice} x ${wishListProvider.wishList[index].unit}",
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
        childCount: wishListProvider.wishList.length,
      ),
    );
  }
}
