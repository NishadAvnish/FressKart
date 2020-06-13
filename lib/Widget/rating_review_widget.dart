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
                child: product.ratingPersonNo == null
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                product.rating.toString(),
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Icon(Icons.star),
                            ],
                          ),
                          Text(
                            "333323124",
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
                          trail: "21215",
                          heading: "5",
                          progress: 100),
                      LinearProgress(
                          color: mainColor,
                          trail: "12000",
                          heading: "4",
                          progress: 100),
                      LinearProgress(
                          color: mainColor,
                          trail: "800",
                          heading: "3",
                          progress: 100),
                      LinearProgress(
                          color: Colors.orange,
                          trail: "400",
                          heading: "2",
                          progress: 100),
                      LinearProgress(
                          color: Colors.red,
                          trail: "100",
                          heading: "1",
                          progress: 100),
                    ]),
              )
            ],
          ),
          SizedBox(height: 12,),

          

        ]);
  }
}
