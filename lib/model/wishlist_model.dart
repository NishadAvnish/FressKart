import 'package:flutter/foundation.dart';

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

  void changeQuantity({String authorId, int updatedUnit}) {
    if (updatedUnit > 0) {
      unit = updatedUnit;
    }
    notifyListeners();
  }
}
