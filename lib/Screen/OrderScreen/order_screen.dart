import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Provider/order_provider.dart';
import 'package:freshkart/Provider/person_detail_provider.dart';
import 'package:freshkart/Widget/must_login.dart';
import 'package:freshkart/Widget/sliver_appbar.dart';
import 'package:provider/provider.dart';

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
    await Provider.of<OrderProvider>(context, listen: false).fetchOrder();
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
    final _orderProvider = Provider.of<OrderProvider>(context);
    final _personDetail = Provider.of<PersonProvider>(context).personDetail;

    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        MySliverAppBar(
          title: "My Order",
        ),
        _personDetail == null
            ? MustLoginWidget()
            : _isLoading
                ? SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.only(bottom: kToolbarHeight),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return ChangeNotifierProvider.value(
                          value: _orderProvider.orderlist[index],
                          child: OrderListItem(index: index),
                        );
                      }, childCount: _orderProvider.orderlist.length),
                    ),
                  )
      ],
    );
  }
}
