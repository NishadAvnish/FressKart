import 'package:flutter/material.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Widget/quickadd_cart_button.dart';
import 'package:freshkart/Widget/list_items.dart';
import 'package:provider/provider.dart';

class BestSellingProducts extends StatelessWidget {
  HomeProductProvider _homeProvider;
  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProductProvider>(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 8.0, bottom: 3),
          child: Text(
            "Best Selling Product",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 12.0),
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              return Container(
                width: 180,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: FeatureItem(
                          productItem: _homeProvider.productList[index],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: _homeProvider.productList.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 5.0);
            },
          ),
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget _price(int index) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Rs " +
                  _homeProvider.productList[index].productQuantityList[0].price
                      .toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(width: 15),
          _homeProvider.productList[index].productQuantityList[0]
                      .newModifiedPrice !=
                  null
              ? Text(
                  "Rs " +
                      _homeProvider.productList[index].productQuantityList[0]
                          .newModifiedPrice
                          .toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey),
                )
              : Container(),
        ]);
  }
}
