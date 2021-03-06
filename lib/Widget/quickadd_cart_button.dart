import 'package:flutter/material.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Provider/cart_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/person_model.dart';
import 'package:freshkart/model/productmodel.dart';
import 'package:freshkart/model/cart_model_and_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class QuickAddToCartButton extends StatefulWidget {
  final ProductModel product;
  final String popUpSelectedItem;
  double height;
  double width;
  double buttonWidth;
  QuickAddToCartButton(
      {this.product,
      this.popUpSelectedItem = "",
      this.height = 25,
      this.width = 90,
      this.buttonWidth = 25});
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<QuickAddToCartButton> {
  int _count;
  PersonModel _personDetail;

  @override
  void initState() {
    _count = 0;
    super.initState();
  }

  @override
  void didUpdateWidget(QuickAddToCartButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.popUpSelectedItem != widget.popUpSelectedItem) {
      setState(() {});
    }
  }

  void _addToCartOperation() {
    ProductListModel _selectedQuantity;
    if (widget.popUpSelectedItem != "") {
      _selectedQuantity = widget.product.productQuantityList.firstWhere(
          (element) => element.quantity == widget.popUpSelectedItem);
    } else {
      _selectedQuantity = widget.product.productQuantityList[0];
    }

    Provider.of<CartProvider>(context, listen: false).addToWishList(
      CartModel(
          id: widget.product.id,
          title: widget.product.title,
          imageUrl: widget.product.imageUrl[0],
          oldPrice: _selectedQuantity.newModifiedPrice == null
              ? null
              : _selectedQuantity.price,
          actualPrice:
              _selectedQuantity.newModifiedPrice ?? _selectedQuantity.price,
          quantity: _selectedQuantity.quantity,
          unit: _count,
          savedPrice: _selectedQuantity.newModifiedPrice == null
              ? 0
              : _selectedQuantity.price - _selectedQuantity.newModifiedPrice),
    );
  }

  @override
  Widget build(BuildContext context) {
    _personDetail = Provider.of<PersonProvider>(context).personDetail;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _count == 0 ? secondaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: _count == 0
          ? InkWell(
              onTap: _personDetail == null
                  ? () => Navigator.of(context).pushNamed("login")
                  : () {
                      setState(() {
                        _count += 1;
                      });
                      _addToCartOperation();
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
            onTap: _personDetail == null
                ? () => Navigator.of(context).pushNamed("login")
                : _count >= 1
                    ? () {
                        setState(() {
                          _count -= 1;
                        });
                        _addToCartOperation();
                      }
                    : null,
            child: _addRemoveButton(Icons.remove)),
        Text(
          _count.toString(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        InkWell(
            onTap: _personDetail == null
                ? () => Navigator.of(context).pushNamed("login")
                : () {
                    if (_count < 10) {
                      setState(() {
                        _count += 1;
                      });
                      _addToCartOperation();
                    }
                  },
            child: _addRemoveButton(Icons.add)),
      ],
    );
  }

  Widget _addRemoveButton(IconData icon) {
    return Container(
        height: widget.height,
        width: widget.buttonWidth,
        decoration: BoxDecoration(
            border: Border.all(),
            color: ternaryColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: Icon(icon));
  }
}
