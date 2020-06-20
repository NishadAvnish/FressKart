import 'package:flutter/material.dart';
import 'package:freshkart/Provider/home_category_provider.dart';
import 'package:freshkart/Provider/homeproduct_provider.dart';
import 'package:freshkart/Util/color.dart';
import 'package:freshkart/model/category_model.dart';
import 'package:provider/provider.dart';

class SubCategoryWidget extends StatefulWidget {
  final CategoryModel categoryItem;

  SubCategoryWidget(this.categoryItem);

  @override
  _SubCategoryWidgetState createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
        width: _size.width,
        constraints: BoxConstraints(maxHeight: 35, minHeight: 32),
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.categoryItem.subCategory.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (_selectedIndex != index) {
                  setState(() {
                    _selectedIndex = index;
                  });

                  Provider.of<HomeMainCategoryProvider>(context, listen: false)
                      .categoryFilter(
                          "Fruits", widget.categoryItem.subCategory[index]);
                }
              },
              child: Container(
                width: _size.width * 0.2,
                constraints: BoxConstraints(maxWidth: 100, minWidth: 60),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.0),
                    color: _selectedIndex == index ? mainColor : Colors.white),
                child: Center(
                    child: Text(
                  widget.categoryItem.subCategory[index],
                  textAlign: TextAlign.center,
                )),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 10.0,
            );
          },
        ));
  }
}
