import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:provider/provider.dart';

class HomeCategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _homeMainCategoryProvider =
        Provider.of<HomeMainCategoryProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 12, top: 5.0, bottom: 3),
            child: Text(
              "Shop By Category",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 500,
                minHeight: 130,
              ),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 2.5 / 2.5),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushNamed("categoryScreen", arguments: index),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Column(children: [
                          Expanded(
                              flex: 3,
                              child: Image.asset(_homeMainCategoryProvider
                                  .mainCategoryList[index].imageUrl)),
                          Flexible(
                            flex: 1,
                            child: Text(
                              _homeMainCategoryProvider
                                  .mainCategoryList[index].title,
                              style: TextStyle(fontSize: 11.5),
                            ),
                          )
                        ])),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
