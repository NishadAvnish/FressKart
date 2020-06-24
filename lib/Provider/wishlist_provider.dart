import 'package:flutter/cupertino.dart';
import 'package:freshkart/model/wishlist_model.dart';

class WishListProvider with ChangeNotifier {
  List<WishListModel> _wishlist = [];

  List<WishListModel> get wishList {
    return [..._wishlist];
  }

  void fetchWishListFromDatabase() {
    _wishlist = [
      WishListModel(
          id: "0",
          title: "Potato",
          imageUrl: "assets/Images/beverages.png",
          oldPrice: 176,
          actualPrice: 170,
          savedPrice: 6,
          unit: 5,
          quantity: "1 Kg"),
      WishListModel(
          id: "1",
          title: "Potato",
          imageUrl: "assets/Images/veggies.png",
          actualPrice: 170,
          savedPrice: 6,
          unit: 5,
          quantity: "1 Kg"),
      WishListModel(
          id: "2",
          title: "Potato This is the best thing you gonna get",
          imageUrl: "assets/Images/fruits.png",
          oldPrice: 176,
          actualPrice: 170,
          savedPrice: 6,
          unit: 5,
          quantity: "1 Kg"),
      WishListModel(
          id: "3",
          title: "Potato",
          imageUrl: "assets/Images/veggies.png",
          actualPrice: 170,
          savedPrice: 6,
          unit: 5,
          quantity: "1 Kg"),
      WishListModel(
          id: "4",
          title: "Potato This is the best thing you gonna get",
          imageUrl: "assets/Images/fruits.png",
          oldPrice: 176,
          actualPrice: 170,
          savedPrice: 6,
          unit: 5,
          quantity: "1 Kg"),
      WishListModel(
          id: "5",
          title: "Potato",
          imageUrl: "assets/Images/veggies.png",
          actualPrice: 170,
          savedPrice: 6,
          unit: 5,
          quantity: "1 Kg"),
      WishListModel(
          id: "6",
          title: "Potato This is the best thing you gonna get",
          imageUrl: "assets/Images/fruits.png",
          oldPrice: 176,
          actualPrice: 170,
          savedPrice: 6,
          unit: 5,
          quantity: "1 Kg"),
    ];
  }

  void removefromList(WishListModel receivedItem) {
    _wishlist.removeWhere((item) => item == receivedItem);
    //we don't call notifyListener here because we use animatedList that by default remove it from UI
  }

  void addToWishList(WishListModel wishListItem) {
    _wishlist.add(wishListItem);
    notifyListeners();
  }

  void changeQuantity(String id, int updatedUnit) {
    final _index = _wishlist.indexWhere((element) => element.id == id);
    if (updatedUnit > 0) {
      _wishlist[_index].unit = updatedUnit;
    } else {
      removefromList(_wishlist[_index]);
    }
    notifyListeners();
  }
}
