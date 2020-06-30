import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:freshkart/Provider/notifier_values.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Widget/Sliver_appbar.dart';
import 'package:freshkart/Widget/list_items.dart';
import 'package:freshkart/Widget/home_category_widget.dart';
import 'package:provider/provider.dart';
import 'Widgets/home_best_selling.dart';

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
    await Provider.of<HomeProductProvider>(context, listen: false).fetchItem();
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
    _homeProvider = Provider.of<HomeProductProvider>(context, listen: true);
    return CustomScrollView(controller: _scrollController, slivers: [
      MySliverAppBar(title: "FressKart"),
      _isLoading
          ? SliverFillRemaining(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height: 170.0,
                          width: double.infinity,
                          child: Carousel(
                            images: [
                              NetworkImage(
                                "https://images.unsplash.com/photo-1588615419957-bf66d53c6b49?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                              ),
                              NetworkImage(
                                  'https://images.unsplash.com/photo-1593087470062-9cb963d64d8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                              NetworkImage(
                                  'https://images.unsplash.com/photo-1593462512927-2d51160b5981?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                            ],
                            boxFit: BoxFit.fill,
                            autoplayDuration: Duration(seconds: 8),
                            showIndicator: true,
                            indicatorBgPadding: 0.0,
                            dotBgColor: Colors.transparent,
                            dotColor: Colors.grey,
                            dotIncreasedColor: Colors.white,
                            dotSize: 5.0,
                            moveIndicatorFromBottom: 10.0,
                            noRadiusForIndicator: false,
                          )),
                    ),
                  ),
                  HomeCategoryWidget(),
                  BestSellingProducts(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 8.0, bottom: 3),
                    child: Text(
                      "Featured Top Product",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.0 / 2.8),
                        itemBuilder: (context, int index) {
                          return FeatureItem(
                            productItem: _homeProvider.productList[index],
                          );
                        },
                        itemCount: _homeProvider.productList.length,
                      ),
                    ),
                  ),
                  SizedBox(height: 55)
                ],
              ),
            )
    ]);
  }
}
