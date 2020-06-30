import 'package:flutter/material.dart';
import 'package:freshkart/model/category_model.dart';
import 'package:freshkart/model/productmodel.dart';

class HomeMainCategoryProvider with ChangeNotifier {
  List<CategoryModel> _mainCategoryList = [];
  List<ProductModel> _productlist = [];

  bool _sortingFilterClicked = false;
  int _sortingFilterFlag = -1;
  String _subCategoryFlag = "All";
  String _categoryFlag;
  List<ProductModel> _filterList = [];

  List<ProductModel> get productList {
    if (_sortingFilterClicked) {
      return [..._filterList];
    } else {
      return [..._productlist];
    }
  }

  void disposeVariables() {
    //this will dispose all the variables on which the filter opertion either category or sorting filters works
    _sortingFilterClicked = false;
    _sortingFilterFlag = -1;
    _subCategoryFlag = "All";
    _filterList = [];
  }

  Future<void> fetchItem() async {
    await Future.delayed(Duration(seconds: 2));
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
            personno: 135000,
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
            personno: 8000,
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

  List<CategoryModel> get mainCategoryList {
    _mainCategoryList = [
      CategoryModel(
          imageUrl: "assets/Images/fruits.png",
          title: "Fruits",
          subCategory: ["All", "Maaza", "Dew", "Biscuits britania", "Parle-G"]),
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

  List<ProductModel> _ifCategoryFilterSelected() {
    if (_subCategoryFlag != null && _subCategoryFlag != "All") {
      return _productlist
          .where((element) =>
              element.subCategory == _subCategoryFlag &&
              element.category == _categoryFlag)
          .toList();
    } else {
      return _productlist.toList();
    }
  }

  void _sortingFilterHelper() {
    List<ProductModel> _templist = [];
    //tpcheck whether any category is selected or not
    _templist = _ifCategoryFilterSelected();

    // this all the below code is for sorting Filter
    if (_sortingFilterFlag == -1) // this means no filter is selected
    {
      _sortingFilterClicked = true;
      _filterList = _templist;
    } else {
      _sortingFilterClicked = true;
      switch (_sortingFilterFlag) {
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
          _filterList = _templist
            ..sort((b, a) =>
                a.rating.averageRating.compareTo(b.rating.averageRating));
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
  }

  Future<void> sortingFilter(int flag) async {
    _sortingFilterFlag = flag;
    _sortingFilterHelper();
    notifyListeners();
  }

  void categoryFilter(String categoryFlag, String subcategoryFlag) {
    _subCategoryFlag = subcategoryFlag;
    _categoryFlag = categoryFlag;
    _sortingFilterClicked = true;
    _sortingFilterHelper();
    notifyListeners();
  }

  // used by productdetail screen
  ProductModel findById(int id) {
    return _productlist.firstWhere((prod) => prod.id == id);
  }
}
