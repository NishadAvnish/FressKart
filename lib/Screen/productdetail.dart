import 'package:flutter/material.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/productmodel.dart';
import 'package:provider/provider.dart';
import '../Widget/productdetail_pageview.dart';
import '../Widget/productdetail_incdec.dart';

class ProductDetail extends StatefulWidget {
  final productId;
  const ProductDetail({this.productId});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductModel _product;
  int _count;
  @override
  void initState() {
    super.initState();
    _count = 1;
    _callProvider();
  }

  void _callProvider() {
    _product = Provider.of<HomeProductProvider>(context, listen: false)
        .findById(widget.productId);
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
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // the tag show tag on top left i.e is the item have any tag ex. Hot, Sale ,x% Off
                      _tag(),
                      //This productDetailPageView show image carousal on top
                      ProductDetailPageView(product: _product)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                width: _size.width * 0.6,
                                constraints: BoxConstraints(maxWidth: 300),
                                child: Text(
                                  _product.title,
                                  style: Theme.of(context).textTheme.subtitle,
                                )),
                            _price(),
                          ],
                        ),
                        SizedBox(height: 12),
                        _product.rating != null
                            ? Text(
                                "Rating: " +
                                    _product.rating.toString() +
                                    "  (" +
                                    _product.reviewPersonNo.toString() +
                                    ")",
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.grey))
                            : Container(),
                        SizedBox(height: 24),
                        IncDec(_product),
                        SizedBox(height: 24),
                        Text(
                          "Description",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(height: 12),
                        Container(
                            width: _size.width * 0.6,
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Text(
                              _product.description,
                              style: Theme.of(context).textTheme.body1,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Add To Cart"),
              ),
            )
          ],
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
                      .subtitle
                      .copyWith(fontSize: 15)),
            ),
          )
        : Container();
  }

  Widget _price() {
    return Row(
      children: <Widget>[
        Text("₹ " + (_count * _product.productList[0].price).toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: _product.productList[0].newModifiedPrice != null
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: _product.productList[0].newModifiedPrice != null
                    ? Colors.grey
                    : Colors.black)),
        //this conditional operation work if there is new modified price that means the tag is OFF
        _product.productList[0].newModifiedPrice != null
            ? Text(" ₹ " + (_count * _product.productList[0].newModifiedPrice).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ))
            : Container(),
        //this is for adding unit with price i.e kg, Litre, Quintol etc.
        // Text(" /" + _product.productList[0].quantityUnit)
      ],
    );
  }
}
