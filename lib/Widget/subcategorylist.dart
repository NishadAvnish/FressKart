import 'package:flutter/material.dart';
import 'package:freshkart/model/category_model.dart';

Widget SubCategoryList(BuildContext context, CategoryModel categoryItem) {
  final _size = MediaQuery.of(context).size;
  return Container(
      width: _size.width,
      constraints: BoxConstraints(maxHeight: 35, minHeight: 32),
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoryItem.subCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: _size.width * 0.2,
            constraints: BoxConstraints(maxWidth: 100, minWidth: 60),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5.0)),
            child: Center(
                child: Text(
              categoryItem.subCategory[index],
              textAlign: TextAlign.center,
            )),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10.0,
          );
        },
      ));
}
