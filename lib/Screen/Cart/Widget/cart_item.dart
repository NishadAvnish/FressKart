import 'package:flutter/material.dart';
import 'package:freshkart/Provider/cart_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/cart_model_and_provider.dart';
import 'package:provider/provider.dart';

class WishlistItem extends StatelessWidget {
  final int index;
  WishlistItem({this.index});

  List<CartModel> _cartList;

  CartProvider _cartProvider;

  @override
  Widget build(BuildContext context) {
    _cartProvider = Provider.of<CartProvider>(context, listen: true);
    _cartList = _cartProvider.cartList;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _price(),
        Text(_cartList[index].title,
            style: Theme.of(context).textTheme.bodyText2),
        Consumer<CartModel>(
          builder: (context, wishlistModel, _) {
            return _quantityandIncDec(context, wishlistModel);
          },
        )
      ],
    );
  }

  Widget _price() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        "₹ " + _cartList[index].actualPrice.toString(),
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 15),
      _cartList[index].oldPrice != null
          ? Text(
              "₹ " + _cartList[index].oldPrice.toString(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey),
            )
          : Container(),
    ]);
  }

  Widget _quantityandIncDec(BuildContext context, CartModel wishlistModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(_cartList[index].quantity,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.blueGrey)),
        Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                if (_cartList[index].unit == 1) {
                  _cartProvider.removefromList(_cartList[index]);
                } else {
                  wishlistModel.changeQuantity(
                      updatedUnit: _cartList[index].unit -= 1,
                      context: context);
                }
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: ternaryColor,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Icon(Icons.remove),
              ),
            ),
            SizedBox(width: 18),
            Text(
              _cartList[index].unit.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 18),
            InkWell(
              onTap: () {
                if (_cartList[index].unit < 10) {
                  wishlistModel.changeQuantity(
                      updatedUnit: _cartList[index].unit += 1,
                      context: context);
                }
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: ternaryColor,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
