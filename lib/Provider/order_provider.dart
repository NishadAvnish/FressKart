import 'package:flutter/material.dart';
import 'package:freshkart/model/order_model_and_provider.dart';
import 'package:intl/intl.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModelProvider> _orderList = [];
  int _count = 0;

  List<OrderModelProvider> get orderlist {
    return [..._orderList];
  }

  Future<void> fetchOrder() async {
    await Future.delayed(Duration(milliseconds: 100));
    if (_count == 0) {
      // _orderList.clear();
      // _orderList.addAll([
      //   OrderModelProvider(
      //     orderId: "CND-X123",
      //     orderDate: "27/07/2020",
      //     subTotal: 1500.0,
      //     mrp: 1600.0,
      //     discount: 100.0,
      //     deliveryCharge: 80.0,
      //     deliveryAddress: "H-330A, Dakshinpuri, New Delhi-110062",
      //     paymentType: "Online",
      //     status: "Processing",
      //     orderedItemList: [
      //       OrderedItemsModel(
      //           title: "Product 1", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 2", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 3", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 4", quantity: "200 g", price: 200.0, unit: 5),
      //     ],
      //   ),
      //   OrderModelProvider(
      //     orderId: "CND-X123",
      //     orderDate: "27/07/2020",
      //     subTotal: 1500.0,
      //     mrp: 1600.0,
      //     discount: 100.0,
      //     deliveryCharge: 80.0,
      //     deliveryAddress: "H-330A, Dakshinpuri, New Delhi-110062",
      //     paymentType: "Online",
      //     status: "Delivered",
      //     orderedItemList: [
      //       OrderedItemsModel(
      //           title: "Product 1", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 2", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 3", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 4", quantity: "200 g", price: 200.0, unit: 5),
      //     ],
      //   ),
      //   OrderModelProvider(
      //     orderId: "CND-X123",
      //     orderDate: "27/07/2020",
      //     subTotal: 1500.0,
      //     mrp: 1600.0,
      //     discount: 100.0,
      //     deliveryCharge: 80.0,
      //     deliveryAddress: "H-330A, Dakshinpuri, New Delhi-110062",
      //     paymentType: "C.O.D",
      //     status: "Cancelled",
      //     orderedItemList: [
      //       OrderedItemsModel(
      //           title: "Product 1", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 2", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 3", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 4", quantity: "200 g", price: 200.0, unit: 5),
      //     ],
      //   ),
      //   OrderModelProvider(
      //     orderId: "CND-X125",
      //     orderDate: "28/07/2020",
      //     subTotal: 1500.0,
      //     mrp: 1600.0,
      //     discount: 100.0,
      //     deliveryCharge: 80.0,
      //     deliveryAddress: "H-330A, Dakshinpuri, New Delhi-110062",
      //     paymentType: "CashOnDelivery",
      //     status: "Processing",
      //     orderedItemList: [
      //       OrderedItemsModel(
      //           title: "Product 1", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 2", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 3", quantity: "200 g", price: 200.0, unit: 5),
      //       OrderedItemsModel(
      //           title: "Product 4", quantity: "200 g", price: 200.0, unit: 5),
      //     ],
      //   ),
      // ]);
      // _count += 1;
    }
    notifyListeners();
  }

  Future<void> addToOrder(Map<String, dynamic> orderDetail) {
    final _dateFormat = DateFormat("yyyy-MM-dd – kk:mm");
    var dateTime = _dateFormat.format(DateTime.now());
    _orderList.add(OrderModelProvider(
      orderId: DateTime.now().toString().substring(0, 4) + "1",
      orderDate: dateTime,
      status: "Processing",
      subTotal: orderDetail["totalPrice"],
      mrp: orderDetail["mrp"],
      discount: orderDetail["discount"],
      deliveryCharge: orderDetail["deliveryCharge"],
      orderedItemList: orderDetail["productList"],
      paymentType: orderDetail["paymentMethod"],
      deliveryAddress: orderDetail["deliveryAddress"],
    ));
    print("______________________________________________");
    print(_orderList.length);
    notifyListeners();
  }
}
