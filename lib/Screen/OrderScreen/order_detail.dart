import 'package:flutter/material.dart';
import 'package:freshkart/Provider/order_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/order_model_and_provider.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatelessWidget {
  final int index;
  OrderDetailScreen({this.index});
  OrderModelProvider _orderItem;

  @override
  Widget build(BuildContext context) {
    _orderItem =
        Provider.of<OrderProvider>(context, listen: true).orderlist[index];
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: mainColorGradient,
          ),
        ),
        title: Text(
          "OrderDetail",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 8.0, bottom: kToolbarHeight),
            sliver: SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 12.0,
                ),
                _orderDetail(context),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Items",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 12.0,
                ),
                _itemsDetails(context),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  "Order Status",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  _orderItem.status,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: _orderItem.status == "Delivered"
                          ? secondaryColor
                          : _orderItem.status == "Cancelled"
                              ? Colors.red
                              : mainColor),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget _orderDetail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Order Total",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.grey),
        ),
        SizedBox(
          height: 12.0,
        ),
        _rowedText("MRP", "₹ ${_orderItem.mrp}", context),
        SizedBox(
          height: 4,
        ),
        _rowedText("Discount", "₹ ${_orderItem.discount}", context),
        SizedBox(
          height: 4,
        ),
        _rowedText(
            "Delivery Charge", "₹ ${_orderItem.deliveryCharge}", context),
        SizedBox(
          height: 4,
        ),
        Divider(
          color: secondaryColor,
        ),
        _rowedText("SubTotal", "₹ ${_orderItem.subTotal}", context),
        Divider(
          color: secondaryColor,
        ),
      ],
    );
  }

  Widget _itemsDetails(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _orderItem.orderedItemList.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _orderItem.orderedItemList[index].title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    "Qty: ${_orderItem.orderedItemList[index].quantity}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black54),
                  ),
                  Text(
                    "₹ ${_orderItem.orderedItemList[index].price} x ${_orderItem.orderedItemList[index].unit}",
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
    );
  }

  Widget _rowedText(String heading, String subHeading, BuildContext context,
      [Color color = Colors.black]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(fontSize: 14.0),
        ),
        Text(
          subHeading,
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: color),
        ),
      ],
    );
  }
}
