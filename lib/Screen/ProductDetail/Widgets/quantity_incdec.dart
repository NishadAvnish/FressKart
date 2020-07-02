import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/productmodel.dart';

class IncDec extends StatefulWidget {
  final ProductModel product;
  final selectedProdQuantityIndex;

  IncDec({this.product, this.selectedProdQuantityIndex});

  @override
  _IncDecState createState() => _IncDecState();
}

class _IncDecState extends State<IncDec> {
  ProductListModel _selected;

  @override
  void initState() {
    super.initState();
    _selected =
        widget.product.productQuantityList[widget.selectedProdQuantityIndex];
  }

  @override
  void dispose() {
    productUnit.value = 1;
    super.dispose();
  }

  Widget _buttonContainer(IconData icon) {
    return Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            border: Border.all(),
            color: ternaryColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: Icon(icon));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ValueListenableBuilder(
            valueListenable: productUnit,
            builder: (context, listenedUnitValue, _) {
              return Row(
                children: <Widget>[
                  InkWell(
                    onTap: listenedUnitValue > 1
                        ? () {
                            productUnit.value -= 1;
                          }
                        : null,
                    child: _buttonContainer(Icons.remove),
                  ),
                  SizedBox(width: 20),
                  Text(
                    listenedUnitValue.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 18),
                  InkWell(
                      onTap: () {
                        if (productUnit.value < 10) productUnit.value += 1;
                      },
                      child: _buttonContainer(Icons.add)),
                ],
              );
            }),
        DropdownButton<ProductListModel>(
          value: _selected,
          onChanged: (productlist) {
            setState(() {
              _selected = productlist;
              // if the user change the packet quantity then price will change too;
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
