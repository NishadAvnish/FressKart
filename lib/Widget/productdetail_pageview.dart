import 'package:flutter/cupertino.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/productmodel.dart';

class ProductDetailPageView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPageView({this.product});

  @override
  Widget build(BuildContext context) {
    final _size=MediaQuery.of(context).size;
    return Container(
                        height: _size.height * 0.4,
                        width: _size.width,
                        constraints:
                            BoxConstraints(maxHeight: 300, minHeight: 275),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: secondaryColor))),
                        child: PageView.builder(
                          itemCount: product.imageUrl.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(
                              product.imageUrl[index],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      );
  }
}