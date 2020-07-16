import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/quickadd_cart_button.dart';
import 'package:freshkart/model/productmodel.dart';

class HorizontalItem extends StatefulWidget {
  final ProductModel productItem;

  const HorizontalItem({this.productItem});

  @override
  _HorizontalListItemState createState() => _HorizontalListItemState();
}

class _HorizontalListItemState extends State<HorizontalItem> {
  String _quantityPopUpSelected;
  int _selectedProdQuantityIndex;

  @override
  void initState() {
    super.initState();
    _quantityPopUpSelected = widget.productItem.productQuantityList[0].quantity;
  }

  void getSelectedQuantityIndex() {
    _selectedProdQuantityIndex = widget.productItem.productQuantityList
        ?.indexWhere((product) => product.quantity == _quantityPopUpSelected);
    _selectedProdQuantityIndex =
        _selectedProdQuantityIndex == -1 ? 0 : _selectedProdQuantityIndex;
  }

  @override
  Widget build(BuildContext context) {
    getSelectedQuantityIndex();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed("productDetailScreen", arguments: {
                    "productId": widget.productItem.id,
                    "selectedProdQuantityIndex": _selectedProdQuantityIndex
                  });
                },
                child: Container(
                  width: 120,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage(widget.productItem.imageUrl[0]),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -5,
                left: -5,
                child: widget.productItem.tag == null
                    ? Container()
                    : Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: secondaryColor, shape: BoxShape.circle),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.productItem.tag,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              )
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(10.0)),
              child: _productDetail(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productDetail() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _price(),
          Text(
            widget.productItem.title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() {
                    _quantityPopUpSelected = value;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return widget.productItem.productQuantityList
                      .map((quantityListItem) {
                    return PopupMenuItem(
                      value: quantityListItem.quantity,
                      child: Text(quantityListItem.quantity),
                    );
                  }).toList();
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      widget
                          .productItem
                          .productQuantityList[_selectedProdQuantityIndex]
                          .quantity,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
              QuickAddToCartButton(
                popUpSelectedItem: _quantityPopUpSelected,
                product: widget.productItem,
              ),
              SizedBox(
                width: 4,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _price() {
    final _productQuantityList =
        widget.productItem.productQuantityList[_selectedProdQuantityIndex];
    return Row(
      children: <Widget>[
        Text(
          "₹ ${_productQuantityList.price}",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: _productQuantityList.newModifiedPrice != null
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: _productQuantityList.newModifiedPrice != null
                  ? Colors.grey
                  : Colors.black),
        ),
        _productQuantityList.newModifiedPrice != null
            ? Text(
                " ₹  ${_productQuantityList.newModifiedPrice}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            : Container(),
      ],
    );
  }
}
