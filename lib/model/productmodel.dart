class ProductModel {
  final int id;
  final String title, description;
  final List<String> imageUrl;
  final double rating;
  final int reviewPersonNo;
  final String tag;
  final List<ProductQuantityPrice> productList;
  ProductModel({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.productList,
    this.rating,
    this.reviewPersonNo,
    this.tag,
  });

  //tag is for knowing that it is a SALE ,HOT, off etc
}

class ProductQuantityPrice {
  final String quantity;
  final double price;
  final double newModifiedPrice;

  ProductQuantityPrice({this.quantity, this.price, this.newModifiedPrice});
}
