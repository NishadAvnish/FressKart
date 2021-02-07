import 'package:flutter/cupertino.dart';
import 'package:freshkart/model/cart_model_and_provider.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartList = List();
  int count = 0;
  double _totalPrice = 0.0;
  double _mrp = 0.0;
  double _deliveryCharge = 0.0;
  double _discountPrice = 0.0;

  List<CartModel> get cartList {
    return [..._cartList];
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
    _cartList.forEach((wishlistItem) {
      final current_mrp = (wishlistItem.oldPrice != null
          ? wishlistItem.oldPrice
          : wishlistItem.actualPrice);
      _mrp += current_mrp * wishlistItem.unit;

      _discountPrice += wishlistItem.savedPrice.abs() * wishlistItem.unit;
    });

    _totalPrice += _mrp - _discountPrice;
    _deliveryCharge = _totalPrice > 400 ? 0.0 : 80.0;
    _totalPrice += _deliveryCharge;

    notifyListeners();
  }

  void addToWishList(CartModel receivedItem) {
    _cartList.removeWhere((wishlistIten) {
      if (wishlistIten.id == receivedItem.id &&
          wishlistIten.quantity == receivedItem.quantity)
        return true;
      else
        return false;
    });

    _cartList.add(receivedItem);
    totaling();
  }

  void removefromList(CartModel receivedItem) {
    _cartList.removeWhere((item) => item == receivedItem);
    totaling();
  }
}
