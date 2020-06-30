import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/productmodel.dart';

class AddToCartButton extends StatefulWidget {
  final ProductModel product;
  double height;
  double width;
  AddToCartButton({this.product, this.height = 25, this.width = 90});
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int _count;
  @override
  void initState() {
    _count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _count == 0 ? secondaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: _count == 0
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _count += 1;
                });
              },
              child: Center(
                child: Text(
                  "Add To Cart",
                  textAlign: TextAlign.center,
                ),
              ))
          : _incDec(),
    );
  }

  Widget _incDec() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: _count >= 1
              ? () {
                  setState(() {
                    _count -= 1;
                  });
                }
              : null,
          child: Container(
              height: widget.height,
              width: widget.height,
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: ternaryColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Icon(Icons.remove)),
        ),
        Text(
          _count.toString(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        InkWell(
          onTap: () {
            if (_count < 10)
              setState(() {
                _count += 1;
              });
          },
          child: Container(
              height: widget.height,
              width: widget.height,
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: ternaryColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Icon(Icons.add)),
        ),
      ],
    );
  }
}
