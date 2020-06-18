import 'package:flutter/cupertino.dart';
import 'package:freshkart/model/category_model.dart';
import 'package:freshkart/model/productmodel.dart';

import '../model/productmodel.dart';

class HomeProductProvider with ChangeNotifier {
  List<ProductModel> _productlist = [];
  List<CategoryModel> _mainCategoryList = [];
  bool _sortingFilterClicked = false;
  int _sortingFilterFlag = -1;
  String _subCategoryFlag = "All";
  String _categoryFlag;
  List<ProductModel> _filterList = [];
  // List<ProductModel> _subcategoryList = [];

  List<ProductModel> get productList {
    if (_sortingFilterClicked) {
      return [..._filterList];
    } else {
      return [..._productlist];
    }
  }

  List<CategoryModel> get mainCategoryList {
    _mainCategoryList = [
      CategoryModel(
          imageUrl: "assets/Images/fruits.png",
          title: "Fruits",
          subCategory: [
            "All",
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
            "All",
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
          rating: 4.5,
          ratingPersonNo: 400,
          category: "Fruits",
          subCategory: "Maaza"),
      ProductModel(
          id: 3,
          title: "Pepsi",
          imageUrl: ["assets/Images/veggies.png"],
          description: "Fresh Onion and deliverable at time",
          rating: 0.0,
          ratingPersonNo: 0,
          productQuantityList: [
            ProductListModel(
              quantity: "1 Kg",
              price: 400,
              newModifiedPrice: 600,
            )
          ],
          tag: "Hot",
          category: "Fruits",
          subCategory: "Pepsi"),
      ProductModel(
          id: 5,
          title: "Cola",
          imageUrl: [
            "assets/Images/fruits.png",
            "assets/Images/fruits.png",
            "assets/Images/fruits.png"
          ],
          description: "Fresh Onion and deliverable at time",
          rating: 0.0,
          ratingPersonNo: 0,
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
          subCategory: "Cola"),
      ProductModel(
          id: 7,
          title: "Maaza",
          imageUrl: [
            "assets/Images/veggies.png",
            "assets/Images/fruits.png",
            "assets/Images/fruits.png"
          ],
          description: "Fresh Onion and deliverable at time",
          rating: 4.5,
          ratingPersonNo: 400,
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
          subCategory: "Maaza"),
      ProductModel(
          id: 9,
          title: "Mazza",
          imageUrl: ["assets/Images/veggies.png"],
          description: "Fresh Onion and deliverable at time",
          rating: 0.0,
          ratingPersonNo: 0,
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
          subCategory: "Maaza"),
      ProductModel(
          id: 11,
          title: "Pepsi",
          imageUrl: ["assets/Images/veggies.png"],
          description: "Fresh Onion and deliverable at time",
          rating: 0.0,
          ratingPersonNo: 0,
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
          subCategory: "Pepsi"),
      ProductModel(
        id: 12,
        title: "Kiwi",
        imageUrl: ["assets/Images/fruits.png"],
        description: "Fresh Kiwi and deliverable at time",
        rating: 4.5,
        ratingPersonNo: 400,
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
          rating: 0.0,
          ratingPersonNo: 0,
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
          subCategory: "Pepsi"),
    ];
  }


  

  Future<void> sortingFilter(int flag) async {
    List<ProductModel> _templist = [];

    if (_subCategoryFlag != null && _subCategoryFlag != "All") {
      _templist = _productlist
          .where((element) =>
              element.subCategory == _subCategoryFlag &&
              element.category == _categoryFlag)
          .toList();
    } else {
      _templist = _productlist.toList();
    }

    _sortingFilterFlag = flag;

    if (flag == -1) // this means no filter is selected
    {
      _sortingFilterClicked = true;
      _filterList = _templist;
    } else {
      _sortingFilterClicked = true;
      switch (flag) {
        case 0: // flag ==0 means sort by price in low to high ordre

          _filterList = _templist
            ..sort((a, b) => (a.productQuantityList[0].price)
                .compareTo(b.productQuantityList[0].price));
          break;

        case 1: //sort by price in high to low order

          _filterList = _templist
            ..sort((a, b) => (a.productQuantityList[0].price)
                .compareTo(b.productQuantityList[0].price));
          _filterList = List.from(_filterList.reversed);
          break;

        case 2: //popularity
          _filterList = _templist..sort((b, a) => a.rating.compareTo(b.rating));
          break;

        default:
          _filterList = _templist.where((element) {
            final _productItem = element.productQuantityList[0];
            return _productItem.newModifiedPrice != null &&
                _productItem.newModifiedPrice > _productItem.price;
          }).toList(); //this line will help us show only discounted price and whose new modifiedPrice is less than actual price

          _filterList = _filterList
            ..sort((a, b) => (a.productQuantityList[0].newModifiedPrice)
                .compareTo(b.productQuantityList[0].newModifiedPrice));
          _filterList = List.from(_filterList.reversed);
          break;
      }
    }
    notifyListeners();
  }

  void categoryFilter(String categoryFlag, String subcategoryFlag) {
    _subCategoryFlag = subcategoryFlag;
    _categoryFlag = categoryFlag;
    _sortingFilterClicked = true;
    if (categoryFlag != null && subcategoryFlag != "All") {
      _filterList = _productlist
          .where((element) =>
              element.subCategory == subcategoryFlag &&
              element.category == categoryFlag)
          .toList();
    } else {
      _filterList = _productlist.toList();
    }
    notifyListeners();
  }

// used by productdetail screen
  ProductModel findById(int id) {
    return _productlist.firstWhere((prod) => prod.id == id);
  }
}
