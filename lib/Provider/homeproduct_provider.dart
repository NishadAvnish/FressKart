import 'package:flutter/cupertino.dart';
import 'package:freshkart/Modal/category_modal.dart';
import 'package:freshkart/Modal/productmodal.dart';

class HomeProductProvider with ChangeNotifier {
  List<ProductModal> _productlist = [];
  List<CategoryModal> _mainCategoryList=[];

  List<ProductModal> get productList {
    return [..._productlist];
  }
  
  List<CategoryModal> get mainCategoryModal{
    _mainCategoryList=[
      CategoryModal(
        imageUrl: "assets/Images/fruits.png",
        title: "Fruits"
      ),
      CategoryModal(
        imageUrl: "assets/Images/veggies.png",
        title: "Vegetables"
      ),
      CategoryModal(
        imageUrl: "assets/Images/oilandmasala.png",
        title: "Oil, Grains and Masala"
      ),
      CategoryModal(
        imageUrl: "assets/Images/beverages.png",
        title: "Beverages"
      ),
      CategoryModal(
        imageUrl: "assets/Images/fruits.png",
        title: "Fruits"
      ),
      CategoryModal(
        imageUrl: "assets/Images/veggies.png",
        title: "Vegetables"
      ),
      CategoryModal(
        imageUrl: "assets/Images/oilandmasala.png",
        title: "Oil, Grains and Masala"
      ),
      CategoryModal(
        imageUrl: "assets/Images/beverages.png",
        title: "Beverages"
      ),
      CategoryModal(
        imageUrl: "assets/Images/fruits.png",
        title: "Vegetables"
      ),
    ];
    return _mainCategoryList;
  }

  void fetchItem() {
    _productlist = [
      ProductModal(
          title: "Kiwi",
          imageUrl: "assets/Images/fruits.png",
          description: "Fresh Kiwi and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          rating: 4.5,
          reviewPersonNo: 400,
          newModifiedPrice: 8.5),
      ProductModal(
          title: "Onion",
          imageUrl: "assets/Images/veggies.png",
          description: "Fresh Onion and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",),
      ProductModal(
          title: "Kiwi",
          imageUrl: "assets/Images/fruits.png",
          description: "Fresh Kiwi and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          rating: 4.5,
          reviewPersonNo: 400,
          tag: "Sale",
          newModifiedPrice: 8.5),
      ProductModal(
          title: "Onion",
          imageUrl: "assets/Images/veggies.png",
          description: "Fresh Onion and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          tag: "Hot"),
      ProductModal(
          title: "Potato",
          imageUrl: "assets/Images/veggies.png",
          description: "Fresh Kiwi and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          rating: 4.5,
          reviewPersonNo: 400,
          newModifiedPrice: 8.5),
      ProductModal(
          title: "Banana",
          imageUrl: "assets/Images/fruits.png",
          description: "Fresh Onion and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          tag: "Hot"),
      ProductModal(
          title: "Kiwi",
          imageUrl: "assets/Images/fruits.png",
          description: "Fresh Kiwi and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          tag: "Sale",),
      ProductModal(
          title: "Onion",
          imageUrl: "assets/Images/veggies.png",
          description: "Fresh Onion and deliverable at time",
          price: 10.0,
          rating: 4.5,
          reviewPersonNo: 400,
          quantityUnit: "Kg",
          tag: "Hot"),
      ProductModal(
          title: "Kiwi",
          imageUrl: "assets/Images/fruits.png",
          description: "Fresh Kiwi and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          rating: 4.5,
          reviewPersonNo: 400,
          tag: "Sale",),
      ProductModal(
          title: "Onion",
          imageUrl: "assets/Images/veggies.png",
          description: "Fresh Onion and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          tag: "10 % Off"),
      ProductModal(
          title: "Kiwi",
          imageUrl: "assets/Images/fruits.png",
          description: "Fresh Kiwi and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          rating: 4.5,
          reviewPersonNo: 400,
          tag: "Sale",
          newModifiedPrice: 8.5),
      ProductModal(
          title: "Onion",
          imageUrl: "assets/Images/veggies.png",
          description: "Fresh Onion and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
      ),
      ProductModal(
          title: "Kiwi",
          imageUrl: "assets/Images/fruits.png",
          description: "Fresh Kiwi and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          rating: 4.5,
          reviewPersonNo: 400,
          tag: "Sale",
          newModifiedPrice: 8.5),
      ProductModal(
          title: "Onion",
          imageUrl: "assets/Images/veggies.png",
          description: "Fresh Onion and deliverable at time",
          price: 10.0,
          quantityUnit: "Kg",
          tag: "Hot"),
    ];
    
  }
}
