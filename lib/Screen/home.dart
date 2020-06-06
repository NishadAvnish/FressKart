import 'package:flutter/material.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/featureitem.dart';
import 'package:freshkart/Widget/carouselslider.dart';
import 'package:freshkart/Widget/category1.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeProductProvider _homeProvider;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _fetchItems();
  }

  @override
  void _fetchItems() {
    if (this.mounted) {
      Provider.of<HomeProductProvider>(context, listen: false).fetchItem();

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
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProductProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text("FreshKart",
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
          SliverToBoxAdapter(
            child: CarouselSlider(),
          ),
          SliverToBoxAdapter(
            child: Category(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 8.0, bottom: 3),
              child: Text(
                "Featured Top Product",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, int index) {
                    return FeatureItem(
                      productItem: _homeProvider.productList[index],
                    );
                  },
                  childCount: _homeProvider.productList.length,
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 190,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 2.4)),
          )
        ],
      ),
    );
  }
}
