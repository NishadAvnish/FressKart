import 'package:flutter/material.dart';
import 'package:freshkart/Provider/wishlist_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/wishlist_model.dart';
import 'package:provider/provider.dart';

class WishlistItem extends StatefulWidget {
  final int index;
  WishlistItem({this.index});

  @override
  _WishlistItemState createState() => _WishlistItemState();
}

class _WishlistItemState extends State<WishlistItem> {
  List<WishListModel> _wishlist;

  WishListProvider _wishListProvider;

  @override
  Widget build(BuildContext context) {
    _wishListProvider = Provider.of<WishListProvider>(context, listen: true);
    _wishlist = _wishListProvider.wishList;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _price(),
        Text(
          _wishlist[widget.index].title,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(wordSpacing: 3, fontStyle: FontStyle.italic),
        ),
        _quantityandIncDec(context),
      ],
    );
  }

  Widget _price() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text("Rs " + _wishlist[widget.index].actualPrice.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      SizedBox(width: 15),
      _wishlist[widget.index].oldPrice != null
          ? Text(
              "Rs " + _wishlist[widget.index].oldPrice.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey),
            )
          : Container(),
    ]);
  }

  Widget _quantityandIncDec(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(_wishlist[widget.index].quantity,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.blueGrey)),
        Row(
          children: <Widget>[
            InkWell(
                onTap: () {
                  _wishListProvider.changeQuantity(_wishlist[widget.index].id,
                      _wishlist[widget.index].unit -= 1);
                  print(_wishlist[widget.index].unit);
                },
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: ternaryColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Icon(Icons.remove))),
            SizedBox(width: 18),
            Text(
              _wishlist[widget.index].unit.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 18),
            InkWell(
              onTap: () {
                if (_wishlist[widget.index].unit < 10) {
                  _wishListProvider.changeQuantity(_wishlist[widget.index].id,
                      _wishlist[widget.index].unit += 1);
                }
              },
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: ternaryColor,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Icon(Icons.add)),
            ),
          ],
        ),
      ],
    );
  }
}
