class OrderModel {
  final String orderId;
  final String orderTime;
  final double subTotal, mrp, discount, delivery;
  final String paymentType;
  final String deliveryAddress;
  final List<OrderedItemsModel> orderedItemList;

  OrderModel(
      {this.orderId,
      this.orderTime,
      this.subTotal,
      this.mrp,
      this.discount,
      this.delivery,
      this.paymentType,
      this.deliveryAddress,
      this.orderedItemList});
}

class OrderedItemsModel {
  final String title, quantity;
  final double price;
  final int unit;

  OrderedItemsModel({this.title, this.quantity, this.price, this.unit});
}
