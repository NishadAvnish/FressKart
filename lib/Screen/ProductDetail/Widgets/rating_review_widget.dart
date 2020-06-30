import 'package:flutter/material.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/productmodel.dart';

import 'linear_review_progrsss.dart';

class ReviewWidget extends StatelessWidget {
  final ProductModel product;

  const ReviewWidget({this.product});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rating and Review",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.black),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: _size.width / 3,
                height: 100,
                child: product.rating.personno == null
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                product.rating.averageRating.toString(),
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Icon(Icons.star),
                            ],
                          ),
                          Text(
                            product.rating.personno.toString(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: SizedBox(
                    height: 90, width: 1, child: Container(color: Colors.grey)),
              ),
              Container(
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgress(
                          color: mainColor,
                          trail: product.rating.five,
                          heading: "5",
                          progress:
                              product.rating.five / product.rating.personno),
                      LinearProgress(
                          color: mainColor,
                          trail: product.rating.four,
                          heading: "4",
                          progress:
                              product.rating.four / product.rating.personno),
                      LinearProgress(
                          color: mainColor,
                          trail: product.rating.three,
                          heading: "3",
                          progress:
                              product.rating.three / product.rating.personno),
                      LinearProgress(
                          color: Colors.orange,
                          trail: product.rating.two,
                          heading: "2",
                          progress:
                              product.rating.two / product.rating.personno),
                      LinearProgress(
                          color: Colors.red,
                          trail: product.rating.one,
                          heading: "1",
                          progress:
                              product.rating.one / product.rating.personno),
                    ]),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ]);
  }
}
