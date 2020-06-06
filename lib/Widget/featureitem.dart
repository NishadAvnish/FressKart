import 'package:flutter/material.dart';
import 'package:freshkart/Modal/productmodal.dart';
import 'package:freshkart/Util/color.dart';

class FeatureItem extends StatelessWidget {
  final ProductModal productItem;
  const FeatureItem({this.productItem});

  @override
  Widget build(BuildContext context) {

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Image.asset(
                        productItem.imageUrl,
                        fit: BoxFit.cover,
                      )),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 3),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(productItem.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            productItem.rating != null
                                ? Text(
                                    productItem.rating.toString() +
                                        "  (" +
                                        productItem.reviewPersonNo.toString() +
                                        ")",
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Colors.grey))
                                : Container(),
                            Row(
                              children: <Widget>[
                                Text("₹ " + productItem.price.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration:
                                            productItem.newModifiedPrice != null
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                        color:
                                            productItem.newModifiedPrice != null
                                                ? Colors.grey
                                                : Colors.black)),
                                //this conditional operation work if there is new modified price that means the tag is OFF
                                productItem.newModifiedPrice != null
                                    ? Text(
                                        " ₹ " +
                                            productItem.newModifiedPrice
                                                .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ))
                                    : Container(),
                                //this is for adding unit with price i.e kg, Litre, Quintol etc.
                                Text(" /" + productItem.quantityUnit)
                              ],
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                child: productItem.tag == null
                    ? Container()
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: secondaryColor,
                        ),
                        child: Text(productItem.tag)))
          ]),
        ));
  }
}
