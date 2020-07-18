import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              _columnedText("OrderId", "CND-X123", context),
              Divider(
                color: secondaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _columnedText("Order Date", "27/07/2020", context),
                  _columnedText("Order Amount", "₹ 300", context),
                  _columnedText("Payment Type", "Online", context),
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
                      "H-330 A, Dakshinpuri, Sector-5, dr. AmbedkarNagar New Delhi-110062",
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  "View",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: mainColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _columnedText(
      String heading, String subHeading, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(fontSize: 12.0),
        ),
        Text(
          subHeading,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
