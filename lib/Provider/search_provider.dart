import 'package:flutter/cupertino.dart';
import 'package:freshkart/model/productmodel.dart';

class SearchProvider with ChangeNotifier {
  List<ProductModel> _searchedList = [];
  List<String> _popularSearchList = [
    "Potato",
    "Tomato",
    "Mustard Oil",
    "Atta",
    "Rice",
  ];
  List<String> get popularSearch {
    return [..._popularSearchList];
  }

  List<ProductModel> get searchedList {
    return [..._searchedList];
  }

  void searchItem(String productName) {
    _searchedList.clear();
    _searchedList.add(
      ProductModel(
        id: "5",
        title: "Cola",
        imageUrl: [
          "assets/Images/fruits.png",
          "assets/Images/fruits.png",
          "assets/Images/fruits.png"
        ],
        description: "Fresh Onion and deliverable at time",
        productQuantityList: [
          ProductListModel(
            quantity: "300 gram",
            price: 600,
          ),
          ProductListModel(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
        tag: "Hot",
        category: "Fruits",
        subCategory: "Cola",
        rating: RatingModel(
            averageRating: 4.3,
            personno: 135000,
            one: 120,
            two: 6000,
            three: 0,
            four: 8000,
            five: 0),
      ),
    );

    notifyListeners();
  }
}
