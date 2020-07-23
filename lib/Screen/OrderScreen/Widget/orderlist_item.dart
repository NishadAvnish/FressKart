import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshkart/Provider/order_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/order_model_and_provider.dart';
import 'package:provider/provider.dart';

class OrderListItem extends StatelessWidget {
  final int index;
  OrderListItem({this.index});

  @override
  Widget build(BuildContext context) {
    final _orderItem =
        Provider.of<OrderProvider>(context, listen: true).orderlist[index];
    return Container(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
      height: 200,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _columnedText("OrderId", _orderItem.orderId, context),
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed("orderDetail", arguments: index),
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "View",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: mainColor),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: secondaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _columnedText("Order Date", _orderItem.orderDate, context),
                  _columnedText(
                      "Order Amount", "₹ ${_orderItem.subTotal}", context),
                  _columnedText(
                      "Payment Type", _orderItem.paymentType, context),
                ],
              ),
              Divider(
                color: secondaryColor,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: secondaryColor,
                  ),
                  Flexible(
                    child: Text(
                      _orderItem.deliveryAddress,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              Divider(
                color: secondaryColor,
              ),
              Flexible(
                child: Consumer<OrderModelProvider>(
                    builder: (context, orderModelProvider, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: " Status: ",
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black),
                          ),
                          TextSpan(
                            text: orderModelProvider.status,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: _orderItem.status == "Delivered"
                                        ? secondaryColor
                                        : _orderItem.status == "Cancelled"
                                            ? Colors.red
                                            : mainColor),
                          )
                        ]),
                      ),
                      if (_orderItem.status == "Processing")
                        GestureDetector(
                          onTap: () => Provider.of<OrderModelProvider>(context,
                                  listen: false)
                              .cancelOrder(),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Cancel Order",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        )
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _columnedText(String heading, String subHeading, BuildContext context,
      [Color color = Colors.black]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(fontSize: 12.0),
        ),
        Text(
          subHeading,
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: color),
        ),
      ],
    );
  }
}
