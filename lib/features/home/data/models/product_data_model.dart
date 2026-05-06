class ProductDataModel {
  final String imagePath;
  final String productName;
  final String price;
  final String productId;

  ProductDataModel({
    required this.imagePath,
    required this.productName,
    required this.price, required this.productId,
  });
  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      imagePath: json['coverPictureUrl'] ?? '',
      productName: json['name'] ?? '',
      price: json['price'].toString(),
       productId: json['id'],
    );
  }
}
