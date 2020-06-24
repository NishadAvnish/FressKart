import 'package:flutter/material.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/rating_review_widget.dart';
import 'package:freshkart/model/productmodel.dart';
import 'package:provider/provider.dart';
import '../Widget/productdetail_pageview.dart';
import '../Widget/quantity_incdec.dart';

class ProductDetail extends StatefulWidget {
  final productId;
  const ProductDetail({this.productId});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductModel _product;
  @override
  void initState() {
    super.initState();
    _callProvider();
  }

  void _callProvider() {
    _product = Provider.of<HomeProductProvider>(context, listen: false)
        .findById(widget.productId);
  }

  @override
  void dispose() {
    productUnit.value = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        _product.title,
        style: TextStyle(fontStyle: FontStyle.italic),
      )),
      body: Container(
        height:
            _size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
        width: _size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // the tag show tag on top left i.e is the item have any tag ex. Hot, Sale ,x% Off
                  _tag(),
                  //This productDetailPageView show image carousal on top
                  ProductDetailPageView(product: _product),
                  Positioned(
                    bottom: 2,
                    right: 5,
                    child: Transform.translate(
                      offset: Offset(0, 55),
                      child: MaterialButton(
                        onPressed: () {},
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: ternaryColor,
                        child: Text("Add To Cart"),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 12),
                    Container(
                        width: _size.width * 0.6,
                        constraints: BoxConstraints(maxWidth: 300),
                        child: Text(
                          _product.title,
                          style: Theme.of(context).textTheme.headline6,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _price(),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Quantity",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    IncDec(_product),
                    SizedBox(height: 15),
                    Text(
                      "Description",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 12),
                    Container(
                        width: _size.width * 0.6,
                        constraints: BoxConstraints(maxWidth: 300),
                        child: Text(
                          _product.description,
                          style: Theme.of(context).textTheme.bodyText2,
                        )),
                    Divider(color: secondaryColor),
                    SizedBox(height: 12),
                    ReviewWidget(
                      product: _product,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tag() {
    return _product.tag != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(_product.tag,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 15)),
            ),
          )
        : Container();
  }

  Widget _price() {
    return ValueListenableBuilder(
        valueListenable: productQuantity,
        builder: (context, listenedQuantityValue, _) {
          return ValueListenableBuilder(
              valueListenable: productUnit,
              builder: (context, listenedUnitValue, _) {
                int _index = _product.productQuantityList.indexWhere(
                    (element) => element.quantity == listenedQuantityValue);

                //valuenotifer at first is null

                if (_index == -1) {
                  _index = 0;
                }

                return Row(
                  children: <Widget>[
                    Text(
                        "₹ " +
                            (listenedUnitValue *
                                    _product.productQuantityList[_index].price)
                                .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: _product.productQuantityList[_index]
                                        .newModifiedPrice !=
                                    null
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: _product.productQuantityList[_index]
                                        .newModifiedPrice !=
                                    null
                                ? Colors.grey
                                : Colors.black)),
                    //this conditional operation work if there is new modified price that means the tag is OFF
                    _product.productQuantityList[_index].newModifiedPrice !=
                            null
                        ? Text(
                            " ₹ " +
                                (listenedUnitValue *
                                        _product.productQuantityList[_index]
                                            .newModifiedPrice)
                                    .toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))
                        : Container(),
                    //this is for adding unit with price i.e kg, Litre, Quintol etc.
                    // Text(" /" + _product.productList[0].quantityUnit)
                  ],
                );
              });
        });
  }
}
