import 'package:flutter/material.dart';
import 'package:freshkart/model/productmodel.dart';

class OfferProvider with ChangeNotifier {
  List<ProductModel> _offerList = [];

  List<ProductModel> get offerList {
    return [..._offerList];
  }

  Future<void> fetchOfferList() async {
    await Future.delayed(Duration(seconds: 1));
    _offerList = [
      ProductModel(
          id: "0",
          title: "Kiwi",
          imageUrl: [
            "assets/Images/fruits.png",
            "assets/Images/fruits.png",
            "assets/Images/fruits.png"
          ],
          description:
              "Fresh Kiwi and deliverable at time\n\nFull of nutrition",
          productQuantityList: [
            ProductListModel(
              quantity: "300 gram",
              price: 100,
            ),
            ProductListModel(
              quantity: "1 Kg",
              price: 2400,
              newModifiedPrice: 1800,
            )
          ],
          category: "Fruits",
          subCategory: "Maaza",
          rating: RatingModel(
              averageRating: 4.3,
              personno: 39000,
              one: 0,
              two: 6000,
              three: 12000,
              four: 8000,
              five: 13000),
          tag: "20 %"),
      ProductModel(
        id: "3",
        title: "Pepsi",
        imageUrl: ["assets/Images/veggies.png"],
        description: "Fresh Onion and deliverable at time",
        productQuantityList: [
          ProductListModel(
            quantity: "1 Kg",
            price: 400,
            newModifiedPrice: 600,
          )
        ],
        tag: "30 %",
        category: "Fruits",
        subCategory: "Pepsi",
        rating: RatingModel(
            averageRating: 4.3,
            personno: 32000,
            one: 0,
            two: 6000,
            three: 12000,
            four: 0,
            five: 13000),
      ),
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
        tag: "1+1",
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
      )
    ];
  }
}
