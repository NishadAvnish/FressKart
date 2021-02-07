import 'package:flutter/material.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:provider/provider.dart';
import 'Widgets/bottom_orderamount.dart';
import 'Widgets/order_summary.dart';

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
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
                          height: 3,
                        ),
                        _deliveryDetail(),
                        SizedBox(
                          height: 12,
                        ),
                        _paymentType(context),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text("Order Summary",
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 12,
                    ),
                  ),
                  OrderSummary(),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(bottom: 0, right: 0, left: 0, child: BottomOrderAmount())
        ],
      ),
    );
  }

  Widget _deliveryDetail() {
    return Container(
      height: 90.0,
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Consumer<PersonProvider>(builder: (context, personProvider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(personProvider.personDetail.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15.0)),
                SizedBox(
                  height: 8.0,
                ),
                Flexible(
                  child: Text(personProvider.personDetail.address,
                      style: TextStyle(color: Colors.black54, fontSize: 15.0)),
                ),
              ],
            );
          }),
        ),
      ),
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
