import 'package:flutter/material.dart';
import 'package:freshkart/Provider/cart_provider.dart';
import 'package:freshkart/Provider/order_provider.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/order_model_and_provider.dart';
import 'package:provider/provider.dart';

class BottomOrderAmount extends StatelessWidget {
  int selectedRadioButtonIndex;
  BottomOrderAmount(int selectedRadioButtonIndex) {
    this.selectedRadioButtonIndex = selectedRadioButtonIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide()),
      ),
      child: Consumer<CartProvider>(builder: (context, wishlistProvider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Sub Total ₹ ${wishlistProvider.totalPrice}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.black)),
            MaterialButton(
              onPressed: () {
                List<OrderedItemsModel> _orderedItem = [];
                wishlistProvider.cartList.map(
                  (cartList) => _orderedItem.add(
                    OrderedItemsModel(
                      title: cartList.title,
                      quantity: cartList.quantity,
                      price: cartList.actualPrice,
                      unit: cartList.unit,
                    ),
                  ),
                );

                Map<String, dynamic> _orderDetail = {
                  "mrp": wishlistProvider.MRP,
                  "totalPrice": wishlistProvider.totalPrice,
                  "discount": wishlistProvider.discountPrice,
                  "deliveryCharge": wishlistProvider.deliveryCharge,
                  "productList": _orderedItem,
                  "paymentMethod":
                      selectedRadioButtonIndex == 0 ? "COD" : "Online",
                  "deliveryAddress":
                      Provider.of<PersonProvider>(context, listen: false)
                          .personDetail
                          .address
                };
                Provider.of<OrderProvider>(context, listen: false)
                    .addToOrder(_orderDetail);
                Provider.of<CartProvider>(context, listen: false)
                    .clearCartItems();
                Navigator.of(context).pop();
              },
              color: secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text("Confirm Order",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.white)),
            ),
          ],
        );
      }),
    );
  }
}
