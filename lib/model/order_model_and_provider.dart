import 'package:flutter/cupertino.dart';

class OrderModelProvider with ChangeNotifier {
  final String orderId;
  final String orderDate;
  final double subTotal, mrp, discount, deliveryCharge;
  final String paymentType;
  final String deliveryAddress;
  String status;
  final List<OrderedItemsModel> orderedItemList;

  OrderModelProvider(
      {this.orderId,
      this.orderDate,
      this.subTotal,
      this.mrp,
      this.discount,
      this.deliveryCharge,
      this.paymentType,
      this.deliveryAddress,
      this.status,
      this.orderedItemList});

  void cancelOrder() {
    status = "Cancelled";
    notifyListeners();
  }
}

class OrderedItemsModel {
  final String title, quantity;
  final double price;
  final int unit;

  OrderedItemsModel({this.title, this.quantity, this.price, this.unit});
}
