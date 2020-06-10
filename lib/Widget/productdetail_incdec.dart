import 'package:flutter/material.dart';
import 'package:freshkart/model/productmodel.dart';
import '../Provider/notifier_values.dart';

class IncDec extends StatefulWidget {
  final ProductModel product;

  IncDec(this.product);

  @override
  _IncDecState createState() => _IncDecState();
}

class _IncDecState extends State<IncDec> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Row(
        children: <Widget>[
          InkWell(
              onTap: itemProductno.value > 1
                  ? () {
                      setState(() {
                        itemProductno.value -= 1;
                      });
                    }
                  : null,
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Icon(Icons.remove))),
          SizedBox(width: 20),
          Text(
            itemProductno.value.toString(),
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(width: 20),
          InkWell(
            onTap: () {
              setState(() {
                itemProductno.value += 1;
              });
            },
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(border: Border.all()),
                child: Icon(Icons.add)),
          ),
          Column()
        ],
      )
    ]);
  }
}
