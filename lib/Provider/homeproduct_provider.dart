import 'package:flutter/cupertino.dart';
import 'package:freshkart/model/category_model.dart';
import 'package:freshkart/model/productmodel.dart';

class HomeProductProvider with ChangeNotifier {
  List<ProductModel> _productlist = [];
  List<CategoryModel> _mainCategoryList = [];
  bool _filterClicked = false;
  List<ProductModel> _filterList = [];
  List<ProductModel> get productList {
    if (_filterClicked)
      return [..._filterList];
    else
      return [..._productlist];
  }

  List<CategoryModel> get mainCategoryList {
    _mainCategoryList = [
      CategoryModel(
          imageUrl: "assets/Images/fruits.png",
          title: "Fruits",
          subCategory: [
            "Pepsi",
            "Cola",
            "Sprite",
            "Maaza",
            "Dew",
            "Biscuits britania",
            "Parle-G"
          ]),
      CategoryModel(imageUrl: "assets/Images/veggies.png", title: "Vegetables"),
      CategoryModel(
          imageUrl: "assets/Images/oilandmasala.png",
          title: "Oil, Grains and Masala"),
      CategoryModel(
          imageUrl: "assets/Images/beverages.png",
          title: "Beverages",
          subCategory: [
            "Pepsi",
            "Cola",
            "Sprite",
            "Maaza",
            "Dew",
            "Biscuits britania",
            "Parle-G"
          ]),
      CategoryModel(imageUrl: "assets/Images/fruits.png", title: "Fruits"),
      CategoryModel(imageUrl: "assets/Images/veggies.png", title: "Vegetables"),
      CategoryModel(
          imageUrl: "assets/Images/oilandmasala.png",
          title: "Oil, Grains and Masala"),
      CategoryModel(
          imageUrl: "assets/Images/beverages.png", title: "Beverages"),
      CategoryModel(
          imageUrl: "assets/Images/fruits.png",
          title: "Vegetables",
          subCategory: [
            "Pepsi",
            "Cola",
            "Sprite",
            "Maaza",
            "Dew",
            "Biscuits britania",
            "Parle-G"
          ]),
    ];
    return _mainCategoryList;
  }

  void fetchItem() {
    _productlist = [
      ProductModel(
        id: 0,
        title: "Kiwi",
        imageUrl: [
          "assets/Images/fruits.png",
          "assets/Images/fruits.png",
          "assets/Images/fruits.png"
        ],
        description: "Fresh Kiwi and deliverable at time",
        productList: [
          ProductQuantityPrice(
            quantity: "300 gram",
            price: 800,
          ),
          ProductQuantityPrice(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
        rating: 4.5,
        reviewPersonNo: 400,
      ),
      ProductModel(
          id: 1,
          title: "Onion",
          imageUrl: ["assets/Images/veggies.png", "assets/Images/fruits.png"],
          description: "Fresh Onion and deliverable at time",
          productList: [
            ProductQuantityPrice(
              quantity: "300 gram",
              price: 800,
              newModifiedPrice: 600,
            ),
          ]),
      ProductModel(
          id: 2,
          title: "Kiwi",
          imageUrl: ["assets/Images/fruits.png"],
          description: "Fresh Kiwi and deliverable at time",
          rating: 4.5,
          reviewPersonNo: 400,
          tag: "Sale",
          productList: [
            ProductQuantityPrice(
              quantity: "300 gram",
              price: 800,
            ),
            ProductQuantityPrice(
              quantity: "1 Kg",
              price: 800,
              newModifiedPrice: 600,
            )
          ]),
      ProductModel(
          id: 3,
          title: "Onion",
          imageUrl: ["assets/Images/veggies.png"],
          description: "Fresh Onion and deliverable at time",
          productList: [
            ProductQuantityPrice(
              quantity: "1 Kg",
              price: 800,
              newModifiedPrice: 600,
            )
          ],
          tag: "Hot"),
      ProductModel(
          id: 4,
          title: "Potato",
          imageUrl: ["assets/Images/veggies.png"],
          description: "Fresh Kiwi and deliverable at time",
          rating: 4.5,
          reviewPersonNo: 400,
          productList: [
            ProductQuantityPrice(
              quantity: "300 gram",
              price: 800,
            ),
            ProductQuantityPrice(
              quantity: "1 Kg",
              price: 800,
              newModifiedPrice: 600,
            )
          ]),
      ProductModel(
          id: 5,
          title: "Banana",
          imageUrl: [
            "assets/Images/fruits.png",
            "assets/Images/fruits.png",
            "assets/Images/fruits.png"
          ],
          description: "Fresh Onion and deliverable at time",
          productList: [
            ProductQuantityPrice(
              quantity: "300 gram",
              price: 800,
            ),
            ProductQuantityPrice(
              quantity: "1 Kg",
              price: 800,
              newModifiedPrice: 600,
            )
          ],
          tag: "Hot"),
      ProductModel(
        id: 6,
        title: "Kiwi",
        imageUrl: ["assets/Images/fruits.png"],
        description: "Fresh Kiwi and deliverable at time",
        productList: [
          ProductQuantityPrice(
            quantity: "300 gram",
            price: 800,
            newModifiedPrice: 600,
          ),
          ProductQuantityPrice(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
        tag: "Sale",
      ),
      ProductModel(
          id: 7,
          title: "Onion",
          imageUrl: [
            "assets/Images/veggies.png",
            "assets/Images/fruits.png",
            "assets/Images/fruits.png"
          ],
          description: "Fresh Onion and deliverable at time",
          rating: 4.5,
          reviewPersonNo: 400,
          tag: "Hot",
          productList: [
            ProductQuantityPrice(
              quantity: "300 gram",
              price: 800,
            ),
            ProductQuantityPrice(
              quantity: "1 Kg",
              price: 800,
              newModifiedPrice: 600,
            )
          ]),
      ProductModel(
        id: 8,
        title: "Kiwi",
        imageUrl: ["assets/Images/fruits.png"],
        description: "Fresh Kiwi and deliverable at time",
        productList: [
          ProductQuantityPrice(
            quantity: "300 gram",
            price: 800,
            newModifiedPrice: 600,
          ),
          ProductQuantityPrice(
            quantity: "1 Kg",
            price: 800,
          ),
          ProductQuantityPrice(
            quantity: "4 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
        rating: 4.5,
        reviewPersonNo: 400,
        tag: "Sale",
      ),
      ProductModel(
        id: 9,
        title: "Onion",
        imageUrl: ["assets/Images/veggies.png"],
        description: "Fresh Onion and deliverable at time",
        productList: [
          ProductQuantityPrice(
            quantity: "300 gram",
            price: 800,
          ),
          ProductQuantityPrice(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          ),
          ProductQuantityPrice(
            quantity: "4 Kg",
            price: 800,
          )
        ],
      ),
      ProductModel(
          id: 10,
          title: "Kiwi",
          imageUrl: ["assets/Images/fruits.png"],
          description: "Fresh Kiwi and deliverable at time",
          rating: 4.5,
          reviewPersonNo: 400,
          tag: "Sale",
          productList: [
            ProductQuantityPrice(
              quantity: "300 gram",
              price: 800,
              newModifiedPrice: 600,
            ),
            ProductQuantityPrice(
              quantity: "1 Kg",
              price: 800,
              newModifiedPrice: 600,
            )
          ]),
      ProductModel(
          id: 11,
          title: "Onion",
          imageUrl: ["assets/Images/veggies.png"],
          description: "Fresh Onion and deliverable at time",
          productList: [
            ProductQuantityPrice(
              quantity: "300 gram",
              price: 800,
              newModifiedPrice: 600,
            ),
            ProductQuantityPrice(
              quantity: "1 Kg",
              price: 800,
              newModifiedPrice: 600,
            )
          ]),
      ProductModel(
          id: 11,
          title: "Kiwi",
          imageUrl: ["assets/Images/fruits.png"],
          description: "Fresh Kiwi and deliverable at time",
          rating: 4.5,
          reviewPersonNo: 400,
          tag: "Sale",
          productList: [
            ProductQuantityPrice(
              quantity: "300 gram",
              price: 800,
              newModifiedPrice: 600,
            ),
            ProductQuantityPrice(
              quantity: "1 Kg",
              price: 800,
              newModifiedPrice: 600,
            )
          ]),
      ProductModel(
        id: 12,
        title: "Onion",
        imageUrl: [
          "assets/Images/veggies.png",
          "assets/Images/fruits.png",
          "assets/Images/fruits.png"
        ],
        description: "Fresh Onion and deliverable at time",
        productList: [
          ProductQuantityPrice(
            quantity: "300 gram",
            price: 800,
            newModifiedPrice: 600,
          ),
          ProductQuantityPrice(
            quantity: "1 Kg",
            price: 800,
            newModifiedPrice: 600,
          )
        ],
      ),
    ];
  }

  void filter() {
    notifyListeners();
  }

  ProductModel findById(int id) {
    return _productlist.firstWhere((prod) => prod.id == id);
  }
}
