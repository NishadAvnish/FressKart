import 'package:flutter/cupertino.dart';
import 'package:freshkart/Screen/Wishlist/Widget/wishlist_item.dart';
import 'package:freshkart/model/wishlist_model_provider.dart';

class WishListProvider with ChangeNotifier {
  List<WishListModel> _wishlist = List();
  int count = 0;
  double _totalPrice = 0.0;
  double _mrp = 0.0;
  double _deliveryCharge = 0.0;
  double _discountPrice = 0.0;

  List<WishListModel> get wishList {
    return [..._wishlist];
  }

  double get totalPrice {
    return _totalPrice;
  }

  double get MRP {
    return _mrp;
  }

  double get deliveryCharge {
    return _deliveryCharge;
  }

  double get discountPrice {
    return _discountPrice;
  }

  Future<void> fetchWishListFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
    if (count == 0) {
      // _wishlist = [
      //   WishListModel(
      //       id: "0",
      //       title: "Potato",
      //       imageUrl: "assets/Images/beverages.png",
      //       oldPrice: 176,
      //       actualPrice: 170,
      //       savedPrice: 6,
      //       unit: 5,
      //       quantity: "1 Kg"),
      // ];
      count = 1;
    }
  }

  void totaling() {
    _mrp = 0.0;
    _discountPrice = 0.0;
    _totalPrice = 0.0;
    _deliveryCharge = 0.0;
    _wishlist.forEach((wishlistItem) {
      final current_mrp = (wishlistItem.oldPrice != null
          ? wishlistItem.oldPrice
          : wishlistItem.actualPrice);
      _mrp += current_mrp * wishlistItem.unit;

      print("oldPrice ${wishlistItem.unit}");

      _discountPrice += wishlistItem.savedPrice.abs() * wishlistItem.unit;
    });

    _totalPrice += _mrp - _discountPrice;
    _deliveryCharge = _totalPrice > 400 ? 0.0 : 80.0;
    _totalPrice += _deliveryCharge;
  }

  void addToWishList(WishListModel receivedItem) {
    print("avnish");

    _wishlist.removeWhere((wishlistIten) {
      if (wishlistIten.id == receivedItem.id &&
          wishlistIten.quantity == receivedItem.quantity)
        return true;
      else
        return false;
    });
    print("acnish");

    _wishlist.add(receivedItem);
    print("listsize: ${_wishlist.length}");
    totaling();
    notifyListeners();
  }

  void removefromList(WishListModel receivedItem) {
    _wishlist.removeWhere((item) => item == receivedItem);
    totaling();
    notifyListeners();
  }
}
