import 'package:flutter/cupertino.dart';
import 'package:freshkart/model/productmodel.dart';
import '../model/productmodel.dart';

class HomeProductProvider with ChangeNotifier {
  List<ProductModel> _productlist = [];

  List<ProductModel> get productList {
    return [..._productlist];
  }

  Future<void> fetchItem() async {
    await Future.delayed(Duration(seconds: 1));
    _productlist = [
      ProductModel(
        id: 0,
        title: "Kiwi",
        imageUrl: [
          "assets/Images/fruits.png",
          "assets/Images/fruits.png",
          "assets/Images/fruits.png"
        ],
        description: "Fresh Kiwi and deliverable at time\n\nFull of nutrition",
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
      ),
      ProductModel(
        id: 3,
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
        tag: "Hot",
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
        id: 5,
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
      ProductModel(
        id: 7,
        title: "Maaza",
        imageUrl: [
          "assets/Images/veggies.png",
          "assets/Images/fruits.png",
          "assets/Images/fruits.png"
        ],
        description: "Fresh Onion and deliverable at time",
        tag: "Hot",
        productQuantityList: [
          ProductListModel(
            quantity: "300 gram",
            price: 800,
          ),
          ProductListModel(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
        category: "Fruits",
        subCategory: "Maaza",
        rating: RatingModel(
            averageRating: 4.3,
            personno: 135000,
            one: 0,
            two: 6000,
            three: 12000,
            four: 8000,
            five: 13000),
      ),
      ProductModel(
        id: 9,
        title: "Mazza",
        imageUrl: ["assets/Images/veggies.png"],
        description: "Fresh Onion and deliverable at time",
        productQuantityList: [
          ProductListModel(
            quantity: "300 gram",
            price: 1000,
          ),
          ProductListModel(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          ),
          ProductListModel(
            quantity: "4 Kg",
            price: 800,
          )
        ],
        category: "Fruits",
        subCategory: "Maaza",
        rating: RatingModel(
            averageRating: 4.3,
            personno: 135000,
            one: 120,
            two: 6000,
            three: 12000,
            four: 8000,
            five: 13000),
      ),
      ProductModel(
        id: 11,
        title: "Pepsi",
        imageUrl: ["assets/Images/veggies.png"],
        description: "Fresh Onion and deliverable at time",
        productQuantityList: [
          ProductListModel(
            quantity: "300 gram",
            price: 1200,
            newModifiedPrice: 900,
          ),
          ProductListModel(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
        category: "Fruits",
        subCategory: "Pepsi",
        rating: RatingModel(
            averageRating: 0.0,
            personno: 0,
            one: 0,
            two: 0,
            three: 0,
            four: 0,
            five: 0),
      ),
      ProductModel(
        id: 12,
        title: "Kiwi",
        imageUrl: ["assets/Images/fruits.png"],
        description: "Fresh Kiwi and deliverable at time",
        tag: "Sale",
        productQuantityList: [
          ProductListModel(
            quantity: "300 gram",
            price: 1300,
            newModifiedPrice: 300,
          ),
          ProductListModel(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
        rating: RatingModel(
            averageRating: 4.3,
            personno: 135000,
            one: 120,
            two: 6000,
            three: 12000,
            four: 8000,
            five: 13000),
      ),
      ProductModel(
        id: 13,
        title: "Pepsi",
        imageUrl: [
          "assets/Images/veggies.png",
          "assets/Images/fruits.png",
          "assets/Images/fruits.png"
        ],
        description: "Fresh Onion and deliverable at time",
        productQuantityList: [
          ProductListModel(
            quantity: "300 gram",
            price: 1400,
            newModifiedPrice: 1200,
          ),
          ProductListModel(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
        category: "Fruits",
        subCategory: "Pepsi",
        rating: RatingModel(
            averageRating: 4.3,
            personno: 135000,
            one: 120,
            two: 6000,
            three: 12000,
            four: 8000,
            five: 13000),
      ),
    ];
  }

// used by productdetail screen
  ProductModel findById(int id) {
    return _productlist.firstWhere((prod) => prod.id == id);
  }
}
