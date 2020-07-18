import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Widget/sliver_appbar.dart';
import 'package:freshkart/model/order_model.dart';

import 'Widget/orderlist_item.dart';

class OrderScreeen extends StatefulWidget {
  @override
  _OrderScreeenState createState() => _OrderScreeenState();
}

class _OrderScreeenState extends State<OrderScreeen> {
  bool _isLoading;
  ScrollController _scrollController;

  @override
  void initState() {
    _isLoading = true;
    _scrollController = ScrollController();
    if (this.mounted)
      _scrollController.addListener(() {
        offset.value = _scrollController.offset;
      });
    _fetchItems();
    super.initState();
  }

  Future<void> _fetchItems() async {
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
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        MySliverAppBar(
          title: "My Order",
        ),
        _isLoading
            ? SliverFillRemaining(
                child: CircularProgressIndicator(),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return OrderListItem();
                }, childCount: 5),
              )
      ],
    );
  }
}
