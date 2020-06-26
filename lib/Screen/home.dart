import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/Widget/Sliver_appbar.dart';
import 'package:freshkart/Widget/list_items.dart';
import 'package:freshkart/Widget/carouselslider.dart';
import 'package:freshkart/Widget/home_category_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  HomeProductProvider _homeProvider;
  bool _isLoading;
  ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      offset.value = _scrollController.offset;
    });
    _fetchItems();
  }

  void _fetchItems() {
    if (this.mounted) {
      Provider.of<HomeProductProvider>(context, listen: false).fetchItem();
      _isLoading = false;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProductProvider>(context, listen: true);
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        MySliverAppBar(title: "FressKart"),
        SliverToBoxAdapter(
          child: SizedBox(
              height: 160.0,
              width: double.infinity,
              child: Carousel(
                images: [
                  AssetImage('assets/Images/fruits.png'),
                  AssetImage('assets/Images/oilandmasala.png'),
                  AssetImage('assets/Images/beverages.png'),
                ],
                boxFit: BoxFit.contain,
                autoplayDuration: Duration(seconds: 8),
                showIndicator: true,
                indicatorBgPadding: 0.0,
                dotBgColor: Colors.transparent,
                dotColor: Colors.grey,
                dotIncreasedColor: secondaryColor,
                dotSize: 5.0,
                moveIndicatorFromBottom: 10.0,
                noRadiusForIndicator: false,
              )),
        ),
        SliverToBoxAdapter(
          child: HomeCategoryWidget(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 8.0, bottom: 3),
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
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.0 / 2.8)),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 55))
      ],
    );
  }
}
