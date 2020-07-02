import 'package:flutter/cupertino.dart';
import 'package:freshkart/model/wishlist_model_provider.dart';

class WishListProvider with ChangeNotifier {
  List<WishListModel> _wishlist = [];

  List<WishListModel> get wishList {
    return [..._wishlist];
  }

  Future<void> fetchWishListFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
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

  void addToWishList(WishListModel receivedItem) {
    _wishlist.remove(receivedItem);
    _wishlist.add(receivedItem);
    notifyListeners();
  }

  void removefromList(WishListModel receivedItem) {
    _wishlist.removeWhere((item) => item == receivedItem);
    notifyListeners();
  }
}
