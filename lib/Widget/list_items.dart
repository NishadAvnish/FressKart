import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/productmodel.dart';

class FeatureItem extends StatelessWidget {
  final ProductModel productItem;
  const FeatureItem({this.productItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed("detailScreen", arguments: productItem.id),
      child: MediaQuery.removePadding(
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
                        flex: 4,
                        child: Image.asset(
                          productItem.imageUrl[0],
                          fit: BoxFit.cover,
                        )),
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(productItem.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                  "Rating: " +
                                      productItem.rating.averageRating
                                          .toString() +
                                      "  (" +
                                      productItem.rating.personno.toString() +
                                      ")",
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.grey)),
                              Row(
                                children: <Widget>[
                                  Text(
                                      "₹ " +
                                          productItem
                                              .productQuantityList[0].price
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: productItem
                                                      .productQuantityList[0]
                                                      .newModifiedPrice !=
                                                  null
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          color: productItem
                                                      .productQuantityList[0]
                                                      .newModifiedPrice !=
                                                  null
                                              ? Colors.grey
                                              : Colors.black)),
                                  //this conditional operation work if there is new modified price that means the tag is OFF
                                  productItem.productQuantityList[0]
                                              .newModifiedPrice !=
                                          null
                                      ? Text(
                                          " ₹ " +
                                              productItem.productQuantityList[0]
                                                  .newModifiedPrice
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ))
                                      : Container(),
                                ],
                              ),
                              //this is for adding unit with price i.e kg, Litre, Quintol etc.
                              Text(
                                productItem.productQuantityList[0].quantity,
                                style: TextStyle(fontStyle: FontStyle.italic),
                              )
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
                          child: Text(productItem.tag))),
            ]),
          )),
    );
  }
}
