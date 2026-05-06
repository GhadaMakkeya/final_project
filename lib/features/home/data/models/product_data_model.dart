class ProductDataModel {
  final int id;
  final String imagePath;
  final String productName;
  final String price;
  final String description;
  bool isFavorite;

  ProductDataModel({
    required this.id,
    required this.imagePath,
    required this.productName,
    required this.price,
    this.description = '',
    this.isFavorite = false,
  });
  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      imagePath: json['coverPictureUrl']?.toString() ?? '',
      productName: json['name']?.toString() ?? '',
      price: json['price']?.toString() ?? '0',
      description: json['description']?.toString() ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
