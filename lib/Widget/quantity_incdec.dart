import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/productmodel.dart';
import '../Provider/notifier_values.dart';

class IncDec extends StatefulWidget {
  final ProductModel product;

  IncDec(this.product);

  @override
  _IncDecState createState() => _IncDecState();
}

class _IncDecState extends State<IncDec> {
  ProductListModel _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.product.productQuantityList[0];
  }

  @override
  void dispose() {
    productUnit.value = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            ValueListenableBuilder(
                valueListenable: productUnit,
                builder: (context, listenedUnitValue, _) {
                  return InkWell(
                      onTap: listenedUnitValue > 1
                          ? () {
                              productUnit.value -= 1;
                            }
                          : null,
                      child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: ternaryColor,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Icon(Icons.remove)));
                }),
            SizedBox(width: 20),
            ValueListenableBuilder(
                valueListenable: productUnit,
                builder: (context, productUnitValue, _) {
                  return Text(
                    productUnitValue.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                }),
            SizedBox(width: 18),
            InkWell(
              onTap: () {
                if (productUnit.value < 10) productUnit.value += 1;
              },
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: ternaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Icon(Icons.add)),
            ),
          ],
        ),
        DropdownButton<ProductListModel>(
          value: _selected,
          onChanged: (productlist) {
            setState(() {
              _selected = productlist;
              // if the user change the packet quantity then too price will change;
            });
            productQuantity.value = _selected.quantity;
          },
          items: widget.product.productQuantityList.map((productlistItem) {
            return DropdownMenuItem<ProductListModel>(
              value: productlistItem,
              child: Text(productlistItem.quantity),
            );
          }).toList(),
        ),
      ],
    );
  }
}
