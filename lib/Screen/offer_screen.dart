import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/horizontalItem.dart';
import 'package:freshkart/Widget/quickadd_cart_button.dart';
import 'package:freshkart/Widget/sliver_appbar.dart';
import 'package:provider/provider.dart';
import '../Provider/offer_provider.dart';

class OfferZone extends StatefulWidget {
  @override
  _OfferZoneState createState() => _OfferZoneState();
}

class _OfferZoneState extends State<OfferZone>
    with AutomaticKeepAliveClientMixin {
  bool _isLoading;
  ScrollController _scrollController;
  OfferProvider _offerProvider;
  String _quantityPopUpSelected;

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
  bool get wantKeepAlive => true;

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
          : _offerProvider.offerList.length == 0
              ? SliverFillRemaining(
                  child: Center(child: Text("No Offer Present")))
              : SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return HorizontalItem(
                            productItem: _offerProvider.offerList[index]);
                      },
                      childCount: _offerProvider.offerList.length,
                    ),
                  ),
                )
    ]);
  }
}
