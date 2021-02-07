class ProductModel {
  final String id;
  final String title, description;
  final List<String> imageUrl; // this will be the list and at index 0 the image
  final String tag;
  final List<ProductListModel> productQuantityList;
  final String category,
      subCategory; // this subcategory can be null  because some categories maynot have subcategories
  RatingModel rating;

  ProductModel(
      {this.id,
      this.title,
      this.imageUrl,
      this.description,
      this.productQuantityList,
      this.tag,
      this.category,
      this.subCategory,
      this.rating});

  //tag is for knowing that it is a SALE ,HOT, off etc.
}

class RatingModel {
  // no any field can be null, if the rating is 0 then return 0 from API
  final double averageRating;
  final int personno;
  final int one;
  final int two;
  final int three;
  final int four;
  final int five;

  RatingModel(
      {this.averageRating,
      this.personno,
      this.one,
      this.two,
      this.three,
      this.four,
      this.five});
}

class ProductListModel {
  final String quantity;
  final double price;
  final double newModifiedPrice; // this can be null

  ProductListModel({this.quantity, this.price, this.newModifiedPrice});
}
