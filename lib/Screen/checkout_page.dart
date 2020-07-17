import 'package:flutter/material.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Provider/wishlist_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _radioSelected;
  @override
  void initState() {
    super.initState();
    _radioSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PersonProvider>(context, listen: false).fetchDetail();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: mainColorGradient),
        ),
        title: Text(
          "Checkout",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Delivery Address",
                            style: Theme.of(context).textTheme.subtitle2),
                        MaterialButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed("about"),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.edit),
                              Text(
                                "Edit",
                                style: Theme.of(context).textTheme.button,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    _deliveryDetail(),
                    SizedBox(
                      height: 12,
                    ),
                    _paymentType(context),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _orderSummary(context),
                    SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide()),
                // borderRadius:
                //     BorderRadius.vertical(top: Radius.circular(8.0))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Sub Total ₹ 400",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.black)),
                  Container(
                    color: secondaryColor,
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Confirm Order",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Colors.white)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _deliveryDetail() {
    return Container(
      height: 110.0,
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Consumer<PersonProvider>(builder: (context, personProvider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(personProvider.personDetail.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 18.0)),
                SizedBox(
                  height: 5,
                ),
                Text(personProvider.personDetail.address,
                    style: TextStyle(color: Colors.black54, fontSize: 18.0)),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _orderSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Order Summary", style: Theme.of(context).textTheme.subtitle2),
        SizedBox(
          height: 12,
        ),
        Consumer<WishListProvider>(builder: (context, wishListProvider, _) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 250),
            width: double.infinity,
            // height: wishListProvider.wishList.length * 20.0,
            height: min(20.0 * 40.0, 400),
            child: Card(
              elevation: 2.0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    // color: index % 2 == 0
                    //     ? Colors.white
                    //     : Colors.black.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Item $index",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          "Qty: $index",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.black54),
                        ),
                        Text(
                          "₹ 40.0",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          );
        })
      ],
    );
  }

  Widget _paymentType(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Payment Type", style: Theme.of(context).textTheme.subtitle2),
        SizedBox(
          height: 12,
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioSelected,
              onChanged: (value) {
                setState(() {
                  _radioSelected = value;
                });
              },
            ),
            Text("Cash On Delivery (COD)"),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
                value: 1,
                groupValue: _radioSelected,
                onChanged: (value) {
                  setState(() {
                    _radioSelected = value;
                  });
                }),
            Text("Online Payment"),
          ],
        ),
      ],
    );
  }
}
