import 'package:flutter/material.dart';
import 'package:freshkart/model/order_model_and_provider.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModelProvider> _orderList = [];
  int _count = 0;

  List<OrderModelProvider> get orderlist {
    return [..._orderList];
  }

  Future<void> fetchOrder() async {
    await Future.delayed(Duration(milliseconds: 100));
    if (_count == 0) {
      _orderList.clear();
      _orderList.addAll([
        OrderModelProvider(
          orderId: "CND-X123",
          orderDate: "27/07/2020",
          subTotal: 1500.0,
          mrp: 1600.0,
          discount: 100.0,
          deliveryCharge: 80.0,
          deliveryAddress: "H-330A, Dakshinpuri, New Delhi-110062",
          paymentType: "Online",
          status: "Processing",
          orderedItemList: [
            OrderedItemsModel(
                title: "Product 1", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 2", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 3", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 4", quantity: "200 g", price: 200.0, unit: 5),
          ],
        ),
        OrderModelProvider(
          orderId: "CND-X123",
          orderDate: "27/07/2020",
          subTotal: 1500.0,
          mrp: 1600.0,
          discount: 100.0,
          deliveryCharge: 80.0,
          deliveryAddress: "H-330A, Dakshinpuri, New Delhi-110062",
          paymentType: "Online",
          status: "Delivered",
          orderedItemList: [
            OrderedItemsModel(
                title: "Product 1", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 2", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 3", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 4", quantity: "200 g", price: 200.0, unit: 5),
          ],
        ),
        OrderModelProvider(
          orderId: "CND-X123",
          orderDate: "27/07/2020",
          subTotal: 1500.0,
          mrp: 1600.0,
          discount: 100.0,
          deliveryCharge: 80.0,
          deliveryAddress: "H-330A, Dakshinpuri, New Delhi-110062",
          paymentType: "C.O.D",
          status: "Cancelled",
          orderedItemList: [
            OrderedItemsModel(
                title: "Product 1", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 2", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 3", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 4", quantity: "200 g", price: 200.0, unit: 5),
          ],
        ),
        OrderModelProvider(
          orderId: "CND-X125",
          orderDate: "28/07/2020",
          subTotal: 1500.0,
          mrp: 1600.0,
          discount: 100.0,
          deliveryCharge: 80.0,
          deliveryAddress: "H-330A, Dakshinpuri, New Delhi-110062",
          paymentType: "CashOnDelivery",
          status: "Processing",
          orderedItemList: [
            OrderedItemsModel(
                title: "Product 1", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 2", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 3", quantity: "200 g", price: 200.0, unit: 5),
            OrderedItemsModel(
                title: "Product 4", quantity: "200 g", price: 200.0, unit: 5),
          ],
        ),
      ]);
      _count += 1;
      print("Avnish from orderprovider");
    }
    notifyListeners();
  }
}
