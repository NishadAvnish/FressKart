import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Provider/wishlist_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/Sliver_appbar.dart';
import 'package:freshkart/Screen/Wishlist/Widget/wishlist_item.dart';
import 'package:freshkart/model/wishlist_model_and_provider.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList>
    with AutomaticKeepAliveClientMixin {
  List<WishListModel> _wishlist;
  WishListProvider _wishlistProvider;
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
    await Provider.of<WishListProvider>(context, listen: false)
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
    _wishlistProvider = Provider.of<WishListProvider>(context, listen: true);
    _wishlist = _wishlistProvider.wishList;
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        MySliverAppBar(title: "Cart"),
        _isLoading
            ? SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : _wishlistProvider.wishList.length == 0
                ? SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("No products in your cart"),
                        SizedBox(
                          height: 5,
                        ),
                        MaterialButton(
                          color: secondaryColor,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {
                            selectedBottomNavIndex.value = 0;
                          },
                          child: Text("Go To Home"),
                        )
                      ],
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
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
                                        "Rs" + _wishlistProvider.MRP.toString(),
                                        Colors.black),
                                    _topTotalContainerItem(
                                        "Discount",
                                        "Rs" +
                                            _wishlistProvider.discountPrice
                                                .toString(),
                                        mainColor),
                                    _topTotalContainerItem(
                                        "Delivery",
                                        "Rs" +
                                            _wishlistProvider.deliveryCharge
                                                .toString(),
                                        mainColor),
                                    Divider(),
                                    _topTotalContainerItem(
                                        "Sub Total",
                                        "Rs" +
                                            _wishlistProvider.totalPrice
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
                                      "Sub Total: Rs ${_wishlistProvider.totalPrice}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                  RaisedButton(
                                      onPressed: () => Navigator.of(context)
                                          .pushNamed("checkoutScreen"),
                                      color: mainColor,
                                      child: Text("Proceed To CheckOut")),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: _wishlist.length,
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
                    _wishlist[index].imageUrl,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.low,
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  child: ChangeNotifierProvider.value(
                    value: _wishlist[
                        index], // this will help in changing in single WishListItem
                    child: WishlistItem(index: index),
                  ),
                ),
                SizedBox(width: 8),
              ],
            )),
        background: GestureDetector(
          onTap: () {
            _wishlistProvider.removefromList(_wishlist[index]);
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
          style: title == "Sub Total"
              ? Theme.of(context).textTheme.bodyText1
              : Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          info,
          textAlign: TextAlign.start,
          style: title == "Sub Total"
              ? Theme.of(context).textTheme.subtitle2
              : Theme.of(context).textTheme.subtitle2.copyWith(color: color),
        ),
      ],
    );
  }
}
