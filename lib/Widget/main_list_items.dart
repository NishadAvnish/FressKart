import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/quickadd_cart_button.dart';
import 'package:freshkart/model/productmodel.dart';

class MainListItem extends StatefulWidget {
  final ProductModel productItem;

  MainListItem({this.productItem});

  @override
  _MainListItemState createState() => _MainListItemState();
}

class _MainListItemState extends State<MainListItem> {
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
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed("productDetailScreen", arguments: {
                        "productId": widget.productItem.id,
                        "selectedProdQuantityIndex": _selectedProdQuantityIndex
                      }),
                      child: Image.asset(
                        widget.productItem.imageUrl[0],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(widget.productItem.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                                "Rating: " +
                                    widget.productItem.rating.averageRating
                                        .toString() +
                                    "  (" +
                                    widget.productItem.rating.personno
                                        .toString() +
                                    ")",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.grey)),
                            //price
                            _price(),
                            //this is for measure unit available  and Add to Cart for a product
                            _lowerProductOrderDetail(),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: widget.productItem.tag == null
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: secondaryColor,
                      ),
                      child: Text(widget.productItem.tag),
                    ),
            ),
          ]),
        ));
  }

  Widget _price() {
    return Row(
      children: <Widget>[
        Text(
            "₹ " +
                widget.productItem
                    .productQuantityList[_selectedProdQuantityIndex].price
                    .toString(),
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration: widget
                            .productItem
                            .productQuantityList[_selectedProdQuantityIndex]
                            .newModifiedPrice !=
                        null
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: widget
                            .productItem
                            .productQuantityList[_selectedProdQuantityIndex]
                            .newModifiedPrice !=
                        null
                    ? Colors.grey
                    : Colors.black)),
        //this conditional operation work if there is new modified price that means the tag is OFF
        widget.productItem.productQuantityList[_selectedProdQuantityIndex]
                    .newModifiedPrice !=
                null
            ? Text(
                " ₹ " +
                    widget
                        .productItem
                        .productQuantityList[_selectedProdQuantityIndex]
                        .newModifiedPrice
                        .toString(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ))
            : Container(),
      ],
    );
  }

  Widget _lowerProductOrderDetail() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.start,
      runSpacing: 5,
      spacing: 8,
      direction: Axis.vertical,
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
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5.0)),
            child: Text(
              widget.productItem.productQuantityList[_selectedProdQuantityIndex]
                  .quantity,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        QuickAddToCartButton(
          popUpSelectedItem: _quantityPopUpSelected,
          product: widget.productItem,
          width: 150,
          height: 25,
          buttonWidth: 35,
        )
      ],
    );
  }
}
