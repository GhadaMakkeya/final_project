class ProductDataModel {
  final String imagePath;
  final String productName;
  final String price;

  ProductDataModel({
    required this.imagePath,
    required this.productName,
    required this.price,
  });
  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      imagePath: json['coverPictureUrl'] ?? '',
      productName: json['name'] ?? '',
      price: json['price'].toString(),
    );
  }
}
