import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Provider/wishlist_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/Sliver_appbar.dart';
import 'package:freshkart/Widget/wishlist_item.dart';
import 'package:freshkart/model/wishlist_model_provider.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList>
    with AutomaticKeepAliveClientMixin {
  List<WishListModel> _wishlist;
  WishListProvider _wishListProvider;
  bool _isLoading;
  ScrollController _scrollController;

  GlobalKey<SliverAnimatedListState> _listKey;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _scrollController = ScrollController();
    _listKey = GlobalKey<SliverAnimatedListState>();
    _scrollController.addListener(() {
      offset.value = _scrollController.offset;
    });
    _fetchItems();
  }

  void _fetchItems() {
    if (this.mounted) {
      Provider.of<WishListProvider>(context, listen: false)
          .fetchWishListFromDatabase();
      _isLoading = false;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //temporary purpose
    _fetchItems();
  }

  @override
  void dispose() {
    _scrollController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _wishListProvider = Provider.of<WishListProvider>(context, listen: true);
    _wishlist = _wishListProvider.wishList;
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        MySliverAppBar(title:"Cart"),
        SliverToBoxAdapter(
            child: Card(
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: 180,
              minHeight: 120,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _topDetaileItem("MRP", "Rs" + "1234", Colors.black),
                  _topDetaileItem("Discount", "- Rs" + "100", mainColor),
                  _topDetaileItem("Delivery", "Rs" + "80", mainColor),
                  Divider(),
                  _topDetaileItem("Sub Total", "Rs" + "1214", Colors.black),
                ]),
          ),
        )),
        SliverToBoxAdapter(
          child: Card(
            child: Container(
              padding: EdgeInsets.only(left: 12.0),
              height: 40,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(3.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sub Total: Rs ${1230}",
                      style: Theme.of(context).textTheme.subtitle2),
                  MaterialButton(
                      onPressed: () {},
                      color: ternaryColor,
                      child: Text("Proceed To CheckOut")),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 12),
          sliver: SliverAnimatedList(
              key: _listKey,
              initialItemCount: _wishlist.length,
              itemBuilder: (context, index, animation) =>
                  _buildItem(animation, index)),
        ),
      ],
    );
  }

  Widget _buildItem(Animation animation, int index) {
    return FadeTransition(
      opacity: animation.drive(Tween<double>(begin: 0.0, end: 1.0)),
      child: SizeTransition(
        sizeFactor: animation.drive(Tween<double>(begin: 0, end: 1)),
        child: (_wishlist.isNotEmpty)
            ? Card(
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: 100,
                        maxHeight: 130,
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
                          SizedBox(width: 8)
                        ],
                      )),
                  background: GestureDetector(
                    onTap: () {
                      final removedItem = _wishlist.removeAt(index);
                      _wishListProvider.removefromList(removedItem);
                      AnimatedListRemovedItemBuilder builder =
                          (context, animation) {
                        return _buildItem(
                            animation, index == 0 ? index : index - 1);
                      };
                      _listKey.currentState.removeItem(index, builder);
                    },
                    child: Container(
                      color: Colors.red[300],
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.delete, size: 40)),
                    ),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }

  // the top total discount sub total container
  Widget _topDetaileItem(String title, String info, Color color) {
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
