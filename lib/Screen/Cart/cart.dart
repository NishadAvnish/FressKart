import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Provider/cart_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/Sliver_appbar.dart';
import 'package:freshkart/Screen/Cart/Widget/cart_item.dart';
import 'package:freshkart/Widget/error_dialog.dart';
import 'package:freshkart/Widget/must_login.dart';
import 'package:freshkart/model/person_model.dart';
import 'package:freshkart/model/cart_model_and_provider.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  final int flag;

  const WishList({Key key, this.flag}) : super(key: key);
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList>
    with AutomaticKeepAliveClientMixin {
  List<CartModel> _cartList;
  CartProvider _cartProvider;
  PersonModel _personDetail;
  bool _isLoading;
  ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _isLoading = true;
    _scrollController = ScrollController();
    if (this.mounted) {
      _scrollController.addListener(() {
        offset.value = _scrollController.offset;
      });
      _fetchItems();
    }
    super.initState();
  }

  Future<void> _fetchItems() async {
    await Provider.of<CartProvider>(context, listen: false)
        .fetchWishListFromDatabase();

    if (!this.mounted) return;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cartProvider = Provider.of<CartProvider>(context, listen: true);
    _cartList = _cartProvider.cartList;
    _personDetail = Provider.of<PersonProvider>(context).personDetail;

    return widget.flag == 0
        ? _body()
        : Scaffold(body: _body()); // because of black screen
  }

  Widget _body() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        MySliverAppBar(title: "Cart"),
        _personDetail == null
            ? MustLoginWidget()
            : _isLoading
                ? SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : _cartProvider.cartList.length == 0
                    ? SliverFillRemaining(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No product in your Cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            GestureDetector(
                              onTap: () => selectedBottomNavIndex.value = 0,
                              child: Text(
                                "Go to Home",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SliverPadding(
                        padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            top: 8.0,
                            bottom: kToolbarHeight),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Text(
                                "Order Total",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Card(
                                elevation: 3.0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 12.0),
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxHeight: 160,
                                    minHeight: 150,
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        _topTotalContainerItem(
                                            "MRP",
                                            "₹ " + _cartProvider.MRP.toString(),
                                            Colors.black),
                                        _topTotalContainerItem(
                                            "Discount",
                                            "₹ " +
                                                _cartProvider.discountPrice
                                                    .toString(),
                                            mainColor),
                                        _topTotalContainerItem(
                                            "Delivery",
                                            "₹ " +
                                                _cartProvider.deliveryCharge
                                                    .toString(),
                                            mainColor),
                                        Divider(),
                                        _topTotalContainerItem(
                                            "Sub Total",
                                            "₹ " +
                                                _cartProvider.totalPrice
                                                    .toString(),
                                            Colors.black),
                                      ]),
                                ),
                              ),
                              Card(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12.0),
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                          "Sub Total: Rs ${_cartProvider.totalPrice}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                      RaisedButton(
                                          onPressed: () => Navigator.of(context)
                                              .pushNamed("checkoutScreen"),
                                          color: mainColor,
                                          child: Text(
                                            "Proceed To CheckOut",
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                "Your Cart",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.grey),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: _cartList.length,
                                      itemBuilder: (context, index) =>
                                          _buildCartItem(index)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
      ],
    );
  }

  Widget _buildCartItem(int index) {
    return Card(
      child: Dismissible(
        direction: DismissDirection.endToStart,
        onDismissed: (x) => _cartProvider.removefromList(_cartList[index]),
        key: UniqueKey(),
        child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 90,
              maxHeight: 110,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 130,
                  child: Image.asset(
                    _cartList[index].imageUrl,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.low,
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: ChangeNotifierProvider.value(
                    value: _cartList[
                        index], // this will help in changing value of single WishListItem
                    child: WishlistItem(index: index),
                  ),
                ),
                SizedBox(width: 8),
              ],
            )),
        background: GestureDetector(
          onTap: () {
            _cartProvider.removefromList(_cartList[index]);
          },
          child: Container(
            color: Colors.red[300],
            child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete, size: 40)),
          ),
        ),
      ),
    );
  }

  // the top total discount sub total container
  Widget _topTotalContainerItem(String title, String info, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 13.0),
        ),
        Text(
          info,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 14.0, color: color),
        ),
      ],
    );
  }
}
