class ProductModal{
 final  String title,description,imageUrl;
 final  String quantityUnit;
 final  double price, rating;
 final int reviewPersonNo ;
 final String tag;
 final double newModifiedPrice;

  ProductModal({this.title, this.imageUrl,this.description, this.price,this.quantityUnit, this.rating, this.reviewPersonNo, this.tag,this.newModifiedPrice});

 //tag is for knowinfg that it is a SALE ,HOT, off etc
}