import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/quickadd_cart_button.dart';
import 'package:freshkart/Widget/sliver_appbar.dart';
import 'package:provider/provider.dart';
import '../Provider/offer_provider.dart';

class OfferZone extends StatefulWidget {
  @override
  _OfferZoneState createState() => _OfferZoneState();
}

class _OfferZoneState extends State<OfferZone> {
  bool _isLoading;
  ScrollController _scrollController;
  OfferProvider _offerProvider;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _scrollController = ScrollController();
    if (this.mounted)
      _scrollController.addListener(() {
        offset.value = _scrollController.offset;
      });
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    await Provider.of<OfferProvider>(context, listen: false).fetchOfferList();
    if (this.mounted) {
      super.setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _offerProvider = Provider.of<OfferProvider>(context, listen: true);
    return CustomScrollView(controller: _scrollController, slivers: [
      MySliverAppBar(title: "Offer Zone"),
      _isLoading
          ? SliverFillRemaining(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          // : _offerProvider.offerList.length == 0
          //     ? SliverFillRemaining(
          //         child: Center(child: Text("No Offer Present")))
          : SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return _listItem(context);
                },
                    // childCount: _offerProvider.offerList.length,
                    childCount: 10),
              ),
            )
    ]);
  }

// ProductModel product
  Widget _listItem(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 120,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(10.0)),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/Images/snacks.jpg",
                        ),
                        fit: BoxFit.fitHeight,
                      )),
                ),
                Positioned(
                  top: -5,
                  left: -5,
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: secondaryColor, shape: BoxShape.circle),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "30 % off",
                          textAlign: TextAlign.center,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(10.0)),
                  child: _productDetail()),
            ),
          ],
        ));
  }

  Widget _productDetail() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "₹ 300",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            "Snack: Best Qualitysnacks and goods this lkjfsdjsoida",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Card(
                elevation: 4.0,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    width: 100,
                    child: Text(
                      "300 gm",
                      textAlign: TextAlign.center,
                    )),
              ),
              QuickAddToCartButton()
            ],
          )
        ],
      ),
    );
  }
}
