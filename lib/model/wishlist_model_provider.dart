import 'package:flutter/foundation.dart';
import 'package:freshkart/Provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishListModel with ChangeNotifier {
  final String id;
  final String imageUrl;
  final String title;
  final double oldPrice;
  final double actualPrice;
  final String quantity;
  int unit;
  final double savedPrice;

  WishListModel(
      {this.id,
      this.imageUrl,
      this.title,
      this.oldPrice,
      this.actualPrice,
      this.quantity,
      this.unit,
      this.savedPrice});

  void changeQuantity({String authorId, int updatedUnit, context}) {
    if (updatedUnit > 0) {
      unit = updatedUnit;
    }
    Provider.of<WishListProvider>(context, listen: false).totaling();
    notifyListeners();
  }
}
