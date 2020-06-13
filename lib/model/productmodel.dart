class ProductModel {
  final int id;
  final String title, description;
  final List<String> imageUrl;
  final double rating; //rating should be there
  final int ratingPersonNo; //
  final String tag;
  final List<ProductListModel> productQuantityList;
  ProductModel({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.productQuantityList,
    this.rating,
    this.ratingPersonNo,
    this.tag,
  });

  //tag is for knowing that it is a SALE ,HOT, off etc
} 

class RatingModel {
  //final int totalReview;
  
}

class ProductListModel {
  final String quantity;
  final double price;
  final double newModifiedPrice;

  ProductListModel({this.quantity, this.price, this.newModifiedPrice});
}
